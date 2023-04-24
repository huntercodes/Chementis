//
//  ChemistryAPI.swift
//  Chementis
//
//  Created by hunter downey on 4/24/23.
//

import Foundation
import Combine

class ChemistryAPI {
    
    private static let baseURL = "https://periodictable.p.rapidapi.com/"
    private static let elementProperties = "?fields=number,standard_atomic_weight,electron_configuration,density,melting_point,boiling_point"
    
    static func fetchElementData(elementName: String, completion: @escaping (Result<ChemicalElement, Error>) -> Void) {
        let urlString = baseURL + elementName.capitalizingFirstLetter() + elementProperties
            
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
                
            if let data = data {
                let decoder = JSONDecoder()
                    
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Received data:", json) // To check the received data
                    
                    let response = try decoder.decode([String: ChemicalElement].self, from: data)
                    if let element = response[elementName.capitalizingFirstLetter()] {
                        completion(.success(element))
                    } else {
                        completion(.failure(NSError(domain: "Element not found", code: -1, userInfo: nil)))
                    }
                } catch {
                    print("Error decoding:", error) // To check the error while decoding
                    completion(.failure(error))
                }
            }
        }
        .resume()
    }

    
}

