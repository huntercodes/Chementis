//
//  ChemistryAPI.swift
//  Chementis
//
//  Created by hunter downey on 4/24/23.
//

import Foundation

class ChemistryAPI {
    
    private static let baseURL = "https://periodictable.p.rapidapi.com/"
    private static let apiKey = "e62b54f9bamsh1c8bf2eaca5d8f8p150883jsn36c4f96e80d2"
    
    static func fetchAllElementData(completion: @escaping (Result<[ChemicalElement], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/octet-stream", forHTTPHeaderField: "content-type")
        request.setValue(apiKey, forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("periodictable.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    // print("Received data:", json)
                    
                    let response = try decoder.decode([ChemicalElement].self, from: data)
                    completion(.success(response))
                } catch {
                    print("Error decoding:", error) // To check the error while decoding
                    completion(.failure(error))
                }
            }
        }
        .resume()
    }
    
}

