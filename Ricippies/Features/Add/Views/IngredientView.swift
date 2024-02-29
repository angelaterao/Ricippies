//
//  IngredientView.swift
//  Ricippies
//
//  Created by Angela Terao on 09/02/2024.
//

import SwiftUI

struct IngredientView: View {
    
    @Binding var ingredient: Ingredient
    
    
    var body: some View {
        HStack() {
            
            TextField("Flour", text: $ingredient.name)
                .frame(width: 150)
                .onChange(of: ingredient.name) { newName in
                    ingredient.name = newName
                }
                .onSubmit {
                    print(ingredient.name)
                }
            
//            TextField("250", text: $ingredient.amount)
//                .frame(width: 40)
//                .onChange(of: ingredientAmount) { newAmount in
//                    ingredient.amount = newAmount
//                }
            
            Picker("Measure", selection: $ingredient.measure) {
                ForEach(Measure.allCases, id: \.self) { measure in
                    Text(measure.title)
                }
            }
            .tint(Color.black)
            .frame(width: 120)
            
        }
        
    }
    
    
//    @Binding var ingredientName: String
//    @Binding var ingredientAmount: String
//    @Binding var measure: Measure
//
//
//    var body: some View {
//        HStack() {
//
//            TextField("Flour", text: $ingredientName)
//                .frame(width: 150)
//                .onChange(of: ingredientName) { newName in
//                    ingredientName = newName
//                }
//                .onSubmit {
//                    print(ingredientName)
//                }
//
//            TextField("250", text: $ingredientAmount)
//                .frame(width: 40)
////                .onChange(of: ingredientAmount) { newAmount in
////                    ingredient.amount = newAmount
////                }
//
//            Picker("Measure", selection: $measure) {
//                ForEach(Measure.allCases, id: \.self) { measure in
//                    Text(measure.title)
//                }
//            }
//            .tint(Color.black)
//            .frame(width: 120)
//
//        }
//
//    }
        
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
    }
}
