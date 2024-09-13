//
//  NetworkManager.swift
//  NetflixMovies
//
//  Created by Ateeq Ahmed on 13/09/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    
    
    func getMoviesFromServer(completion: @escaping (Result<[MovieModel], Error>) -> Void) {
        
        guard let url = URL(string: "https://www.whats-on-netflix.com/wp-content/plugins/whats-on-netflix/json/alldocs.json?_=1700718031139") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    let result = try  JSONDecoder().decode([MovieModel].self, from: data)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        .resume()
    }
}
