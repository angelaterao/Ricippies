//
//  RecipeDetailViewModel.swift
//  Ricippies
//
//  Created by Angela Terao on 15/02/2024.
//

import Foundation

class RecipeDetailViewModel: ObservableObject {
    
    @Published var recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    func incrementServings() {
        guard recipe.numServings < 50 else { return }
        recipe.numServings += 1
    }
    
    func decrementServings() {
        guard recipe.numServings > 0 else { return }
        recipe.numServings -= 1
    }
    
    func calculateNewAmount(for ingredient: Ingredient, numServings: Int, initialNumServings: Int) -> String {
        let newAmount = (ingredient.amount * Double(numServings)) / Double(initialNumServings)
        
        let formattedAmount: String

        if newAmount.truncatingRemainder(dividingBy: 1) == 0.5 {
            formattedAmount = String(format: "%.1f", newAmount)
        } else {
            formattedAmount = String(format: "%.0f", newAmount)
        }

        return formattedAmount
        
    }
}
