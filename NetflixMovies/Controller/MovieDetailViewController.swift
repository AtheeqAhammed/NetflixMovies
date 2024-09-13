//
//  MovieDetailViewController.swift
//  NetflixMovies
//
//  Created by Ateeq Ahmed on 13/09/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movieModel: MovieModel?

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieName.text = movieModel?.title
        moviePoster.loadImage(url: URL(string: movieModel!.imagePortrait)!)
        movieDescription.text = movieModel?.description
    }

}
