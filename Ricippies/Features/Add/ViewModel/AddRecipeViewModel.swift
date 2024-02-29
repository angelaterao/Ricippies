//
//  AddRicippieViewModel.swift
//  Ricippies
//
//  Created by Angela Terao on 19/02/2024.
//

import Foundation

class AddRecipeViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var numServings: Int = 4
    @Published var ingredients = [Ingredient]()
//    @Published var preparationSteps: [PreparationStep]
    @Published var difficultyLevel: Difficulty = .medium
    @Published var cookingTime: Int = 0
    @Published var bakingTime: Int = 0
    
    private let addRecipeService: AddRecipeService
    
    init(addRecipeService: AddRecipeService) {
        self.addRecipeService = addRecipeService
    }
    
    func addRecipe() async throws {
        
        let recipe = Recipe(id: 1, name: name, imageURLs: [], user: User(id: 1, firstName: "test", familyName: "test", description: "test", imageURL: "", email: "test"), numServings: numServings, ingredients: ingredients, preparationSteps: [PreparationStep(id: 1, description: "test")], difficultyLevel: difficultyLevel, cookingTime: cookingTime, bakingTime: bakingTime, isFavourite: false, isLiked: false)
        
        do {
            try await addRecipeService.postRecipe(recipe: recipe)
        } catch {
            print("DEBUG: Failed to add recipe with error: \(error.localizedDescription)")
        }
    }
    
    
}
