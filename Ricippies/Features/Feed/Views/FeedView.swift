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
    @StateObject var viewModel = FeedViewModel(service: FeedService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Ricippies Feed")
                        .fontWeight(.bold)
                        .font(.system(size: 33))
                    
                    SearchFilterBar()
                    
                    HStack(spacing: 40) {
                        
                        Text("All")
                            .onTapGesture { filterState = .all }
                            .foregroundColor( filterState == .all ? .black : .gray)
                        
                        Text("Others")
                            .onTapGesture { filterState = .others }
                            .foregroundColor( filterState == .others ? .black : .gray)
                        
                        Text("Me")
                            .onTapGesture { filterState = .me }
                            .foregroundColor( filterState == .me ? .black : .gray)
                        
                        Spacer()
                    }
                    .font(.headline)
                }
                
                Spacer(minLength: 20)
                
                LazyVStack(spacing: 33) {
                    
                    switch filterState {
                    case .me :
                        Text("test me")
                    case .all :
                        ForEach(viewModel.recipes) { recipe in
                            NavigationLink(value: recipe) {
                                RecipeCardView(recipe: recipe)
                            }
                        }
                    case .others :
                        Text("test others")
                    }
                }
            }
            .navigationBarHidden(true)
            .padding()
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetailView(recipe: recipe)
                    .navigationBarBackButtonHidden()
            }
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
