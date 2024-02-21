//
//  FeedService.swift
//  Ricippies
//
//  Created by Angela Terao on 31/01/2024.
//

import Foundation

class FeedService {
    
    func fetchRecipes() async throws -> [Recipe] {
        return DeveloperPreview.shared.recipes
    }
    
}

