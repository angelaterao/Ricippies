//
//  Recipe.swift
//  Ricippies
//
//  Created by Angela Terao on 08/01/2024.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    
}

struct RecipeResponse: Decodable {
    
    let request: [Recipe]
}


struct MockData {
    
    static let sampleRecipe = Recipe(id: 001,
                                     name: "Test Recipe",
                                     description: "This is the description of the recipe.",
                                     price: 9.99,
                                     imageURL: "",
                                     calories: 9,
                                     protein: 9,
                                     carbs: 9)
    
    static let recipes = [sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe]
    
}
