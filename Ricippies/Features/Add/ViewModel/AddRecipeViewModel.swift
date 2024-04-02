//
//  AddRicippieViewModel.swift
//  Ricippies
//
//  Created by Angela Terao on 19/02/2024.
//

import Foundation

class AddRecipeViewModel: ObservableObject {
    
    private var id = UUID()
    
    @Published var name: String = ""
    @Published var numServings: Int = 4
    @Published var ingredients = [Ingredient]()
    @Published var preparationSteps = [PreparationStep]()
    @Published var difficultyLevel: Difficulty = .medium
    @Published var cookingTime: Int = 0
    @Published var bakingTime: Int = 0
    
    private var isFavourite = false
    private var isLiked = false
    
    private let addRecipeService: AddRecipeService
    
    init(addRecipeService: AddRecipeService) {
        self.addRecipeService = addRecipeService
    }
    
    func addRecipe() async throws {
        
        let recipe = Recipe(id: 0, name: name, imageURLs: [], user: User(id: 1, firstName: "test", familyName: "test", description: "test", imageURL: "", email: "test"), numServings: numServings, ingredients: ingredients, preparationSteps: preparationSteps, difficultyLevel: difficultyLevel, cookingTime: cookingTime, bakingTime: bakingTime, isFavourite: isFavourite, isLiked: isLiked)
        
        do {
            try await addRecipeService.postRecipe(recipe: recipe)
        } catch {
            print("DEBUG: Failed to add recipe with error: \(error.localizedDescription)")
        }
    }
    
}
