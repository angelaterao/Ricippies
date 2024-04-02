//
//  FeedView.swift
//  Ricippies
//
//  Created by Angela Terao on 13/12/2023.
//

import SwiftUI

enum FilterState {
    case all, others, me
}

struct FeedView: View {
    
    @State private var filterState: FilterState = .all
    
    let recipes: [Recipe]
    
    var body: some View {
        NavigationStack {
            List {
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Ricippies Feed")
                        .fontWeight(.bold)
                        .font(.system(size: 33))
                    
                    SearchFilterBar()
                    
                    HStack(spacing: 40) {
                        
                        Text("All")
                            .onTapGesture { filterState = .all }
                            .foregroundColor( filterState == .all ? .black : .init(white: 0.8))
                        
                        Text("Others")
                            .onTapGesture { filterState = .others }
                            .foregroundColor( filterState == .others ? .black : .init(white: 0.8))
                        
                        Text("Me")
                            .onTapGesture { filterState = .me }
                            .foregroundColor( filterState == .me ? .black : .init(white: 0.8))
                        
                        Spacer()
                    }
                    .font(.headline)
                }
                
                switch filterState {
                case .me :
                    Text("test me")
                case .all :
                    ForEach(recipes) { recipe in
                        ZStack {
                            NavigationLink(destination: RecipeDetailView(recipe: recipe).navigationBarBackButtonHidden()) {
                                EmptyView()
                            }
                            .opacity(0)
                            
                            RecipeCardLargeView(recipe: recipe)
                        }
                    }
                    .listRowSeparator(.hidden)
                case .others :
                    Text("test others")
                }
            }
            .listStyle(.plain)
            .buttonStyle(BorderlessButtonStyle())
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(recipes: DeveloperPreview.shared.recipes)
    }
}
