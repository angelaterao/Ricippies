//
//  AccountView.swift
//  Ricippies
//
//  Created by Angela Terao on 13/12/2023.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel: AccountViewModel
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let height: CGFloat = 250
    
    init(recipes: [Recipe]) {
        _viewModel = StateObject(wrappedValue: AccountViewModel(recipes: recipes))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                Image("appLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 40)
                    .padding([.top], 10)
                
                VStack(alignment: .center, spacing: 25) {
                    
                    ProfilePhotoView(urlString: "https://avatars.githubusercontent.com/u/118790712?v=4", frameWidth: 130, frameHeight: 130)
                    
                    VStack(alignment: .center, spacing: 8) {
                        Text("Angela Terao")
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                        
                        Text("El que no come bien, come mal.")
                            .italic(true)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .font(.system(size: 15))
                    .frame(width: 180, height: 70, alignment: .top)
                    
                }
                .padding()
                
                VStack(spacing: 10) {
                    HStack {
                        VStack {
                            Text("1")
                                .bold()
                            Text("Ricippies")
                        }
                        
                        Divider()
                        
                        VStack {
                            Text("0")
                                .bold()
                            Text("Followers")
                        }
                        
                        Divider()
                        
                        VStack {
                            Text("0")
                                .bold()
                            Text("Following")
                        }
                    }
                    .font(.subheadline)
                    
                    HStack {
                        Button {
                            print("Trying to edit profile")
                        } label: {
                            Text("Edit profile")
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(Color(Constants.brandPrimary))
                                .frame(height: 30)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 1.0)
                                        .foregroundColor(Color(Constants.brandPrimary))
                                }
                        }
                        
                        Button {
                            print("Trying to share profile")
                        } label: {
                            Text("Share profile")
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(Color(Constants.brandPrimary))
                                .frame(height: 30)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 1.0)
                                        .foregroundColor(Color(Constants.brandPrimary))
                                }
                        }
                    }
                    .padding()
                }
                
                Divider().frame(width: 350)
                
                LazyVGrid(columns: columns, spacing: 1) {
                    ForEach(viewModel.recipes) { recipe in
                        NavigationLink(destination:
                                        RecipeDetailView(recipe: recipe)
                            .navigationBarBackButtonHidden()) {
                                RecipeCardSmallView(isShowingAccount: true, recipe: recipe)
                                    .frame(height: height)
                        }
                    }
                }
                .padding()
                
//                ForEach(viewModel.recipes) { recipe in
//                    HStack(spacing: 1) {
//                        NavigationLink(destination: RecipeDetailView(recipe: recipe).navigationBarBackButtonHidden()) {
//                            EmptyView()
//                        }
//                        .opacity(0)
//
//                        RecipeCardSmallView(recipe: recipe)
//                    }
//                }
//                .listRowSeparator(.hidden)
                
                
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(recipes: DeveloperPreview.shared.recipes)
    }
}
