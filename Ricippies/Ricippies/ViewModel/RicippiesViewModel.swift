//
//  RicippiesViewModel.swift
//  Ricippies
//
//  Created by Angela Terao on 18/03/2024.
//

import Foundation

class RicippiesViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    private let service: RicippiesService
    
    init(service: RicippiesService) {
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
