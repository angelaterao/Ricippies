//
//  RecipeCardSmallView.swift
//  Ricippies
//
//  Created by Angela Terao on 27/03/2024.
//

import SwiftUI

struct RecipeCardSmallView: View {
    
    @State var isShowingAccount: Bool = false
    
    let recipe: Recipe
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 12) {
                ImageCarouselView(recipe: recipe)
                    .frame(width: geometry.size.width, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Text(recipe.name)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .frame(width: geometry.size.width, alignment: .leading)
                
                if !isShowingAccount {
                    HStack() {
                        ProfilePhotoView(urlString: recipe.user.imageURL ?? "")
                        
                        VStack(alignment: .leading, spacing: 2) {
                            HStack(spacing: 4) {
                                Text("\(recipe.user.firstName) \(recipe.user.familyName)")
                                    .fontWeight(.semibold)
                            }
                            .font(.system(size: 15))
                        }
                    }
                }
            }
            .foregroundColor(.black)
        }
        
        
        
    }
}

struct RecipeCardSmallView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardSmallView(recipe: DeveloperPreview.shared.recipes[0])
    }
}
