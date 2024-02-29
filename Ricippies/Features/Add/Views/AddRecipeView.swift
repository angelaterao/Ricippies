//
//  AddRicippieView.swift
//  Ricippies
//
//  Created by Angela Terao on 13/12/2023.
//

import SwiftUI

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
    
    var body: some View {
        ScrollView {
            
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .frame(height: 280)
                
                DismissButton(dismiss: _dismiss)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
            
            VStack(spacing: 18) {
                
                RecipeMainInfoView(addRecipeViewModel: addRecipeViewModel, difficultyLevel: $difficultyLevel, numServings: $numServings)
                
                RecipeIngredientsInfoView(ingredientViewModel: ingredientViewModel)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Button {
                        
                        addRecipeViewModel.difficultyLevel = difficultyLevel
                        addRecipeViewModel.numServings = numServings
                        addRecipeViewModel.ingredients = ingredientViewModel.recipeIngredients
                        
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
    

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text("Ingredients")
                
                IngredientView(ingredientViewModel: ingredientViewModel)
                
                Text("Ingredient name: \(ingredientViewModel.ingredient.name)")
                Text("Ingredient measure: \(ingredientViewModel.ingredient.measure.title)")
                
//                ForEach($ingredients, id: \.self) { index in
//                    HStack {
//                        IngredientView(ingredient: $ingredientViewModel.ingredient)
//
//                        Button {
////                                ingredientNames.remove(at: index)
//                            print(ingredients)
//                        } label: {
//                            Image(systemName: "trash")
//                                .foregroundColor(.gray)
//                        }
//                    }
//
//                }
                
                Button {
                    ingredientViewModel.recipeIngredients.append(ingredientViewModel.ingredient)
                    print(ingredientViewModel.ingredient)
                    print("All ingredients: \(ingredientViewModel.recipeIngredients)")
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
                //            .padding(30)
            }
            
            Spacer()
        }
    }
    
}


struct RecipeMainInfoView: View {

    @ObservedObject var addRecipeViewModel: AddRecipeViewModel

    @Binding var difficultyLevel: Difficulty
    @Binding var numServings: Int

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
                TextField("", value: $addRecipeViewModel.bakingTime, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                Text("min")
                    .foregroundColor(.gray)
            }
            .modifier(FrameTextFieldModifier())
            
            Text("Cooking Time")
            HStack {
                TextField("", value: $addRecipeViewModel.cookingTime, formatter: NumberFormatter())
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
