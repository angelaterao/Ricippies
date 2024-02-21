//
//  FeedViewModel.swift
//  Ricippies
//
//  Created by Angela Terao on 31/01/2024.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    private let service: FeedService
    
    init(service: FeedService) {
        self.service = service
        
        Task { await fetchRecipes() }
    }
    
    func fetchRecipes() async {
        do {
            self.recipes = try await service.fetchRecipes()
        } catch {
            print("DEBUG: Failed to fetch recipes with error: \(error.localizedDescription)")
        }
    }
    
    
}
