//
//  ViewController.swift
//  NetflixMovies
//
//  Created by Ateeq Ahmed on 13/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    var movieData = [MovieModel]()

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        getMoviesData()
    }
    
    func getMoviesData(){
        NetworkManager.shared.getMoviesFromServer { response in
            switch response {
            case .success(let data):
                self.movieData = data
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        
        cell.movieTitle.text = movieData[indexPath.row].title
        cell.moviePoster.loadImage(url: URL(string:  movieData[indexPath.row].imagePortrait)!)
        cell.imdbRating.text = "IMDB rating:  \(movieData[indexPath.row].imdb!)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 20)/2, height: collectionView.frame.height/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let detailView = storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        
        detailView.movieModel = movieData[indexPath.row]
        navigationController?.pushViewController(detailView, animated: true)
    }
}

