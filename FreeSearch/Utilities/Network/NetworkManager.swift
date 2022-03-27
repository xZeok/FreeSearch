//
//  NetworkManager.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 26-03-22.
//

import UIKit

class NetworkManager: NSObject {
    
    static let shared           = NetworkManager()
    private let cache           = NSCache<NSString, UIImage>()
    
    private override init() {}
    
    // MARK: - Request.
    
    func request<T: Codable>(_ router: ServiceRouter, type: T.Type, completion: @escaping (Result<T, FSError>) -> Void) {
        guard let url = URL(string: router.url) else {
            completion(.failure(.invalidURL))
            return
        }
        var urlRequest = URLRequest(url: url)
        switch router.method {
        case .get:
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            let queryItems: [URLQueryItem] = router.parameters.map { parameter in
                URLQueryItem(name: parameter.key, value: parameter.value as? String)
            }
            components?.queryItems = queryItems
            guard let url = components?.url else {
                completion(.failure(.invalidURL))
                return
            }
            urlRequest = URLRequest(url: url)
        case .post, .delete:
            do {
                let data = try JSONSerialization.data(withJSONObject: router.parameters, options: .init())
                urlRequest.httpBody = data
            } catch {
                completion(.failure(.invalidRequest))
            }
        }
        urlRequest.httpMethod = router.method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")

        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let _ =  error {
                completion(.failure(.unableToComplete))
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try jsonDecoder.decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    // MARK: - Download Image.
    
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        
        task.resume()
    }
}

