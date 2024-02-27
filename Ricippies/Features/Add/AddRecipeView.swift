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
    
    @State private var difficulty: Difficulty = .medium
    @State private var numServings: Int = 4
    @State private var ingredients = [Ingredient]()
    
//    @State private var ricippieName = ""
    @State private var preparationTime = ""
    @State private var cookingTime = ""
    
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
                CustomTextField(userAnswer: $addRecipeViewModel.name, textFieldTitle: "Ricippie Name", placeHolder: "Enter ricippie name..")
                
//                CustomTextField(userAnswer: $addRecipeViewModel.bakingTime, textFieldTitle: "Preparation Time", sideInfoText: "min", keyBoardType: .numberPad)
//
//                CustomTextField(userAnswer: $addRecipeViewModel.cookingTime, textFieldTitle: "Cooking Time", sideInfoText: "min", keyBoardType: .numberPad)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Difficulty")
                    
                    Picker("", selection: $difficulty) {
                        ForEach(DifficultyLevel.allCases) { level in
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
                        addRecipeViewModel.difficultyLevel = difficulty
//                        ingredients.append(Ingredient)
                        Task {
                            do {
                                try await addRecipeViewModel.addRecipe()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("Error adding recipe: \(error)")
                            }
                        }
                    } label: {
//                        Text("+ Add Ingredient")
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


struct CustomTextField: View {
    
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
