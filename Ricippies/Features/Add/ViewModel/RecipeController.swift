//
//  RicippieController.swift
//  Ricippies
//
//  Created by Angela Terao on 20/02/2024.
//

import Foundation

class RecipeController: ObservableObject {
    
    @Published private(set) var recipes: [Recipe] = []
    
    func addRecipe(_ recipe: Recipe) {
        recipes.append(recipe)
    }
    
}
