//
//  PreparationStepView.swift
//  Ricippies
//
//  Created by Angela Terao on 05/03/2024.
//

import SwiftUI

struct PreparationStepView: View {
    @ObservedObject var preparationStepViewModel = PreparationStepViewModel(preparationStep: PreparationStep(id: 0, description: ""))
    
    var body: some View {
        HStack() {

            TextField("Stir and mix", text: $preparationStepViewModel.preparationStep.description, axis: .vertical)
                .frame(maxWidth: .infinity)
                .lineLimit(5...)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1.0)
                        .foregroundColor(Color(.systemGray4))
                }
            
            Button {
                preparationStepViewModel.recipePreparationSteps.append(preparationStepViewModel.preparationStep)
                print(preparationStepViewModel.preparationStep)
                print("All steps: \(preparationStepViewModel.recipePreparationSteps)")
            } label: {
                Image(systemName: "checkmark")
                    .foregroundColor(.gray)
            }

        }

    }
}

struct PreparationStepView_Previews: PreviewProvider {
    static var previews: some View {
        PreparationStepView()
    }
}
