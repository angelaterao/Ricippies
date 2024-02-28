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
    @Published var ingredients: [Ingredient]
//    @Published var preparationSteps: [PreparationStep]
    @Published var difficultyLevel: Difficulty = .medium
    @Published var cookingTime: String = ""
    @Published var bakingTime: String = ""
    
    private let addRecipeService: AddRecipeService
    
    init(addRecipeService: AddRecipeService) {
        self.addRecipeService = addRecipeService
    }
    
    func addRecipe() async throws {
        
        // Find another way to convert String to Int (soit le faire dans le recipeView? ou faire une autre fonction dans le viewModel ? Idk
        guard let bakingTimeInt = Int(bakingTime) else { return }
        guard let cookingTimeInt = Int(cookingTime) else { return }
        
        let recipe = Recipe(id: 1, name: name, imageURLs: [], user: User(id: 1, firstName: "test", familyName: "test", description: "test", imageURL: "", email: "test"), numServings: numServings, ingredients: [Ingredient(id: 1, name: "test", amount: 2.0, measure: .gr)], preparationSteps: [PreparationStep(id: 1, description: "test")], difficultyLevel: difficultyLevel, cookingTime: cookingTimeInt, bakingTime: bakingTimeInt, isFavourite: false, isLiked: false)
        
        do {
            try await addRecipeService.postRecipe(recipe: recipe)
        } catch {
            print("DEBUG: Failed to add recipe with error: \(error.localizedDescription)")
        }
    }
    
    
}
