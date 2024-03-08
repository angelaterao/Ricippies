//
//  AddRicippieView.swift
//  Ricippies
//
//  Created by Angela Terao on 13/12/2023.
//

import SwiftUI
import PhotosUI

enum DifficultyLevel: String, CaseIterable, Identifiable {
    case easy, medium, difficult
    var id: String { self.rawValue }
}

struct AddRecipeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @State var difficultyLevel: Difficulty = .medium
    @State var numServings: Int = 4
    
    @ObservedObject var addRecipeViewModel = AddRecipeViewModel(addRecipeService: AddRecipeService())
    
    // Ici j'ai besoin de l'initialiser parce que sinon j'ai une erreur dans la preview+tabview: pq?
    @ObservedObject var ingredientViewModel = IngredientViewModel(ingredient: Ingredient(id: 0, name: "", amount: 0, measure: .gr))
    
    @ObservedObject var preparationStepViewModel = PreparationStepViewModel(preparationStep: PreparationStep(id: 0, description: ""))
    
    var body: some View {
        ScrollView {
            
            ZStack(alignment: .topLeading) {
                
                PhotoSelectorView()
//                    .frame(maxWidth: .infinity, height: 280)
                    .frame(maxWidth: .infinity, maxHeight: 280)
                
                DismissButton(dismiss: _dismiss)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
            
            VStack(alignment: .leading, spacing: 25) {
                
                Text("New Ricippie")
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                RecipeMainInfoView(addRecipeViewModel: addRecipeViewModel, difficultyLevel: $difficultyLevel, numServings: $numServings)
                
                RecipeIngredientsInfoView(ingredientViewModel: ingredientViewModel)
                
                RecipePreparationInfoView(preparationStepViewModel: preparationStepViewModel)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Button {
                        
                        addRecipeViewModel.difficultyLevel = difficultyLevel
                        addRecipeViewModel.numServings = numServings
                        addRecipeViewModel.ingredients = ingredientViewModel.recipeIngredients
                        addRecipeViewModel.preparationSteps = preparationStepViewModel.recipePreparationSteps
                        
                        Task {
                            do {
                                try await addRecipeViewModel.addRecipe()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("Error adding recipe: \(error)")
                            }
                        }
                    } label: {
                        Text("Add Recipe")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .frame(height: 44)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 1.0)
                                    .foregroundColor(Color(.systemGray4))
                            }
                    }
                    .padding(30)
                    
                }
            }
            .padding()
            
        }
        .ignoresSafeArea()
    }
}

struct AddRicippieView_Previews: PreviewProvider {
    static var previews: some View {

        AddRecipeView()
    }
}


struct RecipeIngredientsInfoView: View {
    
    @ObservedObject var ingredientViewModel: IngredientViewModel
    
    @State private var ingredientsCount = 1

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Divider().frame(width: 350)
                
                Spacer(minLength: 25)
                
                Text("Ingredients")
                    .font(.headline)
                
                Spacer(minLength: 25)
                
                VStack {
                    ForEach(1...ingredientsCount, id: \.self) { _ in
                        
                        IngredientView(ingredientViewModel: ingredientViewModel)
                        
                        Spacer(minLength: 10)
                    }
                }

//                Text("Ingredient name: \(ingredientViewModel.ingredient.name)")
//                Text("Ingredient measure: \(ingredientViewModel.ingredient.measure.title)")
//                Text("Ingredients: \(ingredientViewModel.recipeIngredients.count)")
                
                Button {
                    ingredientsCount += 1
                } label: {
                    Text("+ Add Ingredient")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 1.0)
                                .foregroundColor(Color(.systemGray4))
                        }
                }
                .padding(30)
            }
            
            Spacer()
        }
    }
}

struct RecipePreparationInfoView: View {
    
    @ObservedObject var preparationStepViewModel: PreparationStepViewModel
    
    @State private var preparationSteps = 1

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Divider().frame(width: 350)
                
                Spacer(minLength: 25)
                
                Text("Preparation")
                    .font(.headline)
                
                Spacer(minLength: 25)
                
                VStack {
                    ForEach(1...preparationSteps, id: \.self) { _ in
                        
                        PreparationStepView(preparationStepViewModel: preparationStepViewModel)
                        
                        Spacer(minLength: 20)
                    }
                }
                
                Button {
                    preparationSteps += 1
                } label: {
                    Text("+ Add Step")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 1.0)
                                .foregroundColor(Color(.systemGray4))
                        }
                }
                .padding(30)
            }
            
            Spacer()
        }
    }
}


struct RecipeMainInfoView: View {
    
    @ObservedObject var addRecipeViewModel: AddRecipeViewModel

    @Binding var difficultyLevel: Difficulty
    @Binding var numServings: Int
    
    private let quantityFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        formatter.zeroSymbol = ""
        return formatter
    }()

    var body: some View {

        VStack(alignment: .leading, spacing: 13) {
            
            Text("Ricippie Name")
            HStack {
                TextField("Enter ricippie name..", text: $addRecipeViewModel.name)
                    .keyboardType(.alphabet)
                    
            }
            .modifier(FrameTextFieldModifier())
            
            Text("Preparation Time")
            HStack {
                TextField("0", value: $addRecipeViewModel.bakingTime, formatter: quantityFormatter)
                    .keyboardType(.numberPad)

                    
                Text("min")
                    .foregroundColor(.gray)
            }
            .modifier(FrameTextFieldModifier())
            
            Text("Cooking Time")
            HStack {
                TextField("0", value: $addRecipeViewModel.cookingTime, formatter: quantityFormatter)
                    .keyboardType(.numberPad)
                Text("min")
                    .foregroundColor(.gray)
            }
            .modifier(FrameTextFieldModifier())
        }
        
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Difficulty")
            
            Picker("", selection: $difficultyLevel) {
                ForEach(Difficulty.allCases) { level in
                    Text(level.rawValue.capitalized).tag(level)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Stepper {
                Text("\(numServings) servings")
            } onIncrement: {
                numServings += 1
            } onDecrement: {
                guard numServings > 0 else { return }
                numServings -= 1 }
            
        }
    }

}

struct FrameTextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(height: 44)
            .padding(.horizontal)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1.0)
                    .foregroundColor(Color(.systemGray4))
            }
    }
    
}
