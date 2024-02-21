//
//  AddRicippieViewModel.swift
//  Ricippies
//
//  Created by Angela Terao on 19/02/2024.
//

import Foundation

class AddRecipeViewModel: ObservableObject {
    
    @Published var recipeName = ""
    @Published var recipe: Recipe
    
    var recipeController: RecipeController
    
    init(recipe: Recipe, recipeController: RecipeController) {
        self.recipe = recipe
        self.recipeController = recipeController
        self.recipeName = recipe.name 
    }
    
    func addRecipe() {
        recipeController.addRecipe(recipe)
    }
    
    
}
