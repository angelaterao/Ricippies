//
//  SavedRicippiesView.swift
//  Ricippies
//
//  Created by Angela Terao on 13/12/2023.
//

import SwiftUI

struct SavedRicippiesView: View {
    
//    @Binding var isFavourite: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Favourites")
                        .fontWeight(.bold)
                        .font(.system(size: 33))
                }
            }
        }
        .navigationBarHidden(true)
        .padding()
    }
}

struct SavedRicippiesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRicippiesView()
        //isFavourite: .constant(false)
    }
}
