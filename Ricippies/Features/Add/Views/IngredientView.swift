//
//  IngredientView.swift
//  Ricippies
//
//  Created by Angela Terao on 09/02/2024.
//

import SwiftUI

struct IngredientView: View {
    
    @State var ingredientName = ""
    @State var ingredientAmount = ""
    @State var measure: Measure = .gr
    
    var body: some View {
        HStack() {
            
            TextField("Flour", text: $ingredientName)
                .frame(width: 150)
                .onChange(of: ingredientName) { newName in
                    ingredientName = newName
                }
                .onSubmit {
                    print(ingredientName)
                }
            
            TextField("250", text: $ingredientAmount)
                .frame(width: 40)
//                .onChange(of: ingredientAmount) { newAmount in
//                    ingredient.amount = newAmount
//                }
            
            Picker("Measure", selection: $measure) {
                ForEach(Measure.allCases, id: \.self) { measure in
                    Text(measure.title)
                }
            }
            .tint(Color.black)
            .frame(width: 120)
            
        }
        
    }
        
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
    }
}
