//
//  ViewModel.swift
//  Vocapic
//
//  Created by ericzero on 8/6/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
}

class PhotoViewModel {
    
    private let unsplashAccessKey = "lTUsZhE6strM1zJzxgw-gjPqjSwsDSP5_lcj5QtQOws"
    
    func fetchRandomPhoto(searchQuery: String, completion: @escaping (Result<Data, Error>) -> Void) {
        // Encode the searchQuery to make it URL-safe
        guard let encodedQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        // Construct the URL with the encoded searchQuery
        guard let url = URL(string: "https://api.unsplash.com/photos/random?client_id=\(unsplashAccessKey)&query=\(encodedQuery)") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NetworkError.noData))
            }
        }
        task.resume()
    }
}


