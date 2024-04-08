//
//  DeleteRecipeService.swift
//  Ricippies
//
//  Created by Angela Terao on 29/03/2024.
//

import Foundation

class DeleteRecipeService {
    
    enum ServiceError: Error {
        case invalidURL
        case invalidResponse
        case requestFailed(Error)
    }
    
    func deleteRecipe(recipeId: Int) async throws {
        
        let urlString = "http://192.168.1.47:8080/api/rest/1/recipes/\(recipeId)"
        
        guard let url = URL(string: urlString) else { throw ServiceError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            print("statusCode is: \(statusCode!)")
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ServiceError.invalidResponse}
            
        } catch {
            throw ServiceError.requestFailed(error)
        }
        
    }
    
}
