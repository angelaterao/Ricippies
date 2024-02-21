//
//  ViewModelFactory.swift
//  Ricippies
//
//  Created by Angela Terao on 20/02/2024.
//

import Foundation

class ViewModelFactory: ObservableObject {
    let recipeController = RecipeController()
    
    func makeAddRecipeViewModel(recipe: Recipe) -> AddRecipeViewModel {
        return AddRecipeViewModel(recipe: recipe, recipeController: recipeController)
    }
    
}
