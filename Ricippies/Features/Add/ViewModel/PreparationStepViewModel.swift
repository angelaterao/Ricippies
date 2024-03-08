//
//  PreparationStepViewModel.swift
//  Ricippies
//
//  Created by Angela Terao on 05/03/2024.
//

import Foundation

class PreparationStepViewModel: ObservableObject {
    
    @Published var preparationStep: PreparationStep
    @Published var recipePreparationSteps = [PreparationStep]()
    
    init(preparationStep: PreparationStep) {
        self.preparationStep = preparationStep
    }
    
    func addPreparationStep() {
        print("Trying to add preparation step")
    }
    
    func deletePreparationStep() {
        print("Trying to delete preparation step")
    }
    
}
