//
//  AddRecipeService.swift
//  Ricippies
//
//  Created by Angela Terao on 27/02/2024.
//

import Foundation

class AddRecipeService {
    
    enum ServiceError: Error {
        case invalidURL
        case invalidResponse
        case invalidData
        case encodingError(EncodingError)
    }
    
    func postRecipe(recipe: Recipe) async throws {
        
        let urlString = "http://192.168.1.47:8080/api/rest/1/recipes"
        
        guard let url = URL(string: urlString) else { throw ServiceError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(recipe)
            request.httpBody = jsonData
            print("recipe to add: \(String(data: jsonData, encoding: .utf8) ?? "cannot represent as string")")
            
            let (_, response) = try await URLSession.shared.data(for: request)
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            print("statusCode is: \(statusCode!)")
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ServiceError.invalidResponse}
            
            
        } catch let error as EncodingError {
            throw ServiceError.encodingError(error)
        } catch {
            throw ServiceError.invalidData
        }
        
    }
    
}
