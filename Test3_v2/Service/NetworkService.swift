//
//  NetworkService.swift
//  Test
//
//  Created by Максим Зиноватный on 9/28/21.
//  Copyright © 2021 Максим Зиноватный. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    func getArticles(pageNews: Int, urlKey: String, endpoint: String, completion: @escaping (Result<[Article], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getArticles(pageNews: Int, urlKey: String, endpoint: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        let urlString = HardCode.urlApiNewsString(pageNews: pageNews, urlKey: HardCode.firstUrlKeyString, pieceUrlNew: endpoint)
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("ERROR")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                do {
                    let articles = try JSONDecoder().decode(Root.self, from: data)
                    completion(.success(articles.articles))
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
