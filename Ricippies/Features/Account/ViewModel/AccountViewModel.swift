//
//  AccountViewModel.swift
//  Ricippies
//
//  Created by Angela Terao on 18/03/2024.
//

import Foundation

class AccountViewModel: ObservableObject {
    
    @Published var recipes: [Recipe]
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
}
