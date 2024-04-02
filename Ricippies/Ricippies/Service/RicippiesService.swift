//
//  RicippiesService.swift
//  Ricippies
//
//  Created by Angela Terao on 18/03/2024.
//

import Foundation

class RicippiesService {
    
    enum ServiceError: Error {
        case invalidURL
        case invalidResponse
        case invalidData
        case decodingError(DecodingError)
    }
    
    func fetchRecipes() async throws -> [Recipe] {
        return DeveloperPreview.shared.recipes
    }
    
//    func fetchRecipes() async throws -> [Recipe] {
//
//        let urlString = "http://192.168.1.47:8080/api/rest/1/recipes"
//
//        guard let url = URL(string: urlString) else { throw ServiceError.invalidURL }
//
//        do {
//            let (data, response) = try await URLSession.shared.data(from: url)
//            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ServiceError.invalidResponse }
//            print("data: \(String(data: data, encoding: .utf8) ?? "cannot represent as string")")
//            let recipes = try JSONDecoder().decode([Recipe].self, from: data)
//            print("recipes: \(recipes)")
//            print(response)
//            return recipes
//        } catch let error as DecodingError {
//            throw ServiceError.decodingError(error)
//        } catch {
//            throw ServiceError.invalidData
//        }
//    }
    
}
