//
//  ApiManager.swift
//  DemoProject
//
//  Created by Zentech-038 on 31/05/24.
//

import Foundation
import UIKit
import Security
import CommonCrypto

typealias Handler<T> = ( Result<T, DataError> ) -> Void


final class ApiManager {
    
    static let shared = ApiManager()
    private init() {}
//    var token = UserDefaults.standard.value(forKey: Constants.loginTockenConstant) as? String ?? ""
    
//    if token == "" {
//        token = ""
//    }
    
    func request<T: Codable>(
        modelType: T.Type,
        type: EndPointType,
        completion: @escaping Handler<T>) {
                        
            guard let url = type.url else {
                completion(.failure(.invalidURL))
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = type.method.rawValue
            
            
            if let parementer = type.body {
                request.httpBody = try? JSONEncoder().encode(parementer)
            }
            
            request.allHTTPHeaderFields = type.headers
        
        URLSession.shared.dataTask(with: request) { data, response, erroe in
            
            guard let data, erroe == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                
                let response = response as? HTTPURLResponse
                
                print("HTTP Error code = \(response?.statusCode)")

                completion(.failure(.invalidResponse))
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String : Any] {
//                print("Data received = \(json)")
            } else {
                print(data)
            }
            
            do {
                let data = try JSONDecoder().decode(modelType, from: data)
                completion(.success(data))
            } catch {
                completion(.failure(.network(error)))
            }
            
        }.resume()
        
    }
    
    static var commonHeaders: [String: String] {
        return [
            "Content-Type": "application/json",
        ]
    }
}
