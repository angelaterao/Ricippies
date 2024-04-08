//
//  DeleteRecipeViewModel.swift
//  Ricippies
//
//  Created by Angela Terao on 02/04/2024.
//

import Foundation

class DeleteRecipeViewModel: ObservableObject {
    
    @Published var recipeId: Int = 0
    private let service: DeleteRecipeService
    
    init(service: DeleteRecipeService) {
        self.service = service
    }
    
    func deleteRecipe(recipeId: Int) async throws {
        do {
            try await service.deleteRecipe(recipeId: recipeId)
        } catch {
            print("DEBUG: Failed to delete recipe with error: \(error.localizedDescription)")
        }
    }
    
    
}
