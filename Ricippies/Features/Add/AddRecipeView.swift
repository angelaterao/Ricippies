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
    @State var ingredients = [Ingredient]()
    
    @ObservedObject var addRecipeViewModel = AddRecipeViewModel(addRecipeService: AddRecipeService())
    
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
                
                RecipeIngredientsInfoView(ingredients: $ingredients)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Button {
                        
                        addRecipeViewModel.difficultyLevel = difficultyLevel
                        addRecipeViewModel.numServings = numServings
                        
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
    
    @Binding var ingredients: [Ingredient]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text("Ingredients")
                
                IngredientView()
                
                ForEach($ingredients, id: \.self) { index in
                    HStack {
                        IngredientView()
                        
                        Button {
//                                ingredientNames.remove(at: index)
                            print(ingredients)
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(.gray)
                        }
                    }
                    
                }
                
                Button {
//                        ingredients.append(Ingredient)
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
        CustomTextFieldView(userAnswer: $addRecipeViewModel.name, textFieldTitle: "Ricippie Name", placeHolder: "Enter ricippie name..")

        CustomTextFieldView(userAnswer: $addRecipeViewModel.bakingTime, textFieldTitle: "Preparation Time", sideInfoText: "min", keyBoardType: .numberPad)

        CustomTextFieldView(userAnswer: $addRecipeViewModel.cookingTime, textFieldTitle: "Cooking Time", sideInfoText: "min", keyBoardType: .numberPad)
        
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


struct CustomTextFieldView: View {

    @Binding var userAnswer: String

    var textFieldTitle: String = ""
    var placeHolder: String = ""
    var sideInfoText: String = ""
    var keyBoardType: UIKeyboardType = .alphabet
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 13) {
            
            Text(textFieldTitle)
            
            HStack {
                TextField(placeHolder, text: $userAnswer)
                    .onSubmit {
                        print(userAnswer)
                    }
                    .keyboardType(keyBoardType)
                
                Text(sideInfoText)
                    .foregroundColor(.gray)
            }
            .frame(height: 44)
            .padding(.horizontal)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1.0)
                    .foregroundColor(Color(.systemGray4))
            }
        }
    }
    
}
