//
//  IngredientView.swift
//  Ricippies
//
//  Created by Angela Terao on 09/02/2024.
//

import SwiftUI

struct IngredientView: View {

//    @Binding var ingredient: Ingredient

    @ObservedObject var ingredientViewModel = IngredientViewModel(ingredient: Ingredient(id: 0, name: "", amount: 0, measure: .gr))
    

    var body: some View {
        HStack() {

            TextField("Flour", text: $ingredientViewModel.ingredient.name)
                .frame(width: 150)

            TextField("250", value: $ingredientViewModel.ingredient.amount, formatter: NumberFormatter())
                .frame(width: 40)
 
            Picker("Measure", selection: $ingredientViewModel.ingredient.measure) {
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
