//
//  ImageCarouselView.swift
//  Ricippies
//
//  Created by Angela Terao on 10/01/2024.
//

import SwiftUI

struct ImageCarouselView: View {
    
    let recipe: Recipe
 
    var body: some View {
        TabView {
            ForEach(recipe.imageURLs, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarouselView(recipe: DeveloperPreview.shared.recipes[0])
    }
}
