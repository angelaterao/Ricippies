//
//  ListingView.swift
//  Ricippies
//
//  Created by Angela Terao on 09/01/2024.
//

import SwiftUI

struct RecipeCardLargeView: View {
    
    @State var isFavourite: Bool = false
    
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ImageCarouselView(recipe: recipe)
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(recipe.name)
                .fontWeight(.semibold)
                .font(.system(size: 20))
            
            HStack() {
                
               ProfilePhotoView(urlString: recipe.user.imageURL ?? "")
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        Text("By")
                        Text("\(recipe.user.firstName) \(recipe.user.familyName)")
                            .fontWeight(.semibold)
                    }
                    .font(.system(size: 15))
                    
                    HStack(spacing: 4) {
                        Text("27 minutes")
                        Text("ago")
                    }
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    
                }
                
                Spacer()
                
                Button {
                    isFavourite.toggle()
                } label: {
                    isFavourite ? Image("bookmark_selected") : Image("bookmark")

                }

            }
        }
        .foregroundColor(.black)
    }
    
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardLargeView(recipe: DeveloperPreview.shared.recipes[0])
    }
}
