//
//  IngredientViewModel.swift
//  Ricippies
//
//  Created by Angela Terao on 28/02/2024.
//

import Foundation

class IngredientViewModel: ObservableObject {
    
    @Published var ingredient: Ingredient
    @Published var recipeIngredients = [Ingredient]()
    
    init(ingredient: Ingredient) {
        self.ingredient = ingredient
    }
    
    func addIngredient() {
        print("Trying to add ingredient")
    }
    
    func deleteIngredient() {
        print("Trying to delete ingredient")
    }
    
    
    
    
}
