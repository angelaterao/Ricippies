//
//  AccountView.swift
//  Ricippies
//
//  Created by Angela Terao on 13/12/2023.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel: AccountViewModel
    
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
                
                VStack(spacing: 20) {
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
                                .foregroundColor(.black)
                                .frame(height: 30)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color(.systemGray6)))
                        }
                        
                        Button {
                            print("Trying to share profile")
                        } label: {
                            Text("Share profile")
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(.black)
                                .frame(height: 30)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color(.systemGray6)))
                        }
                    }
                    .padding()
                }
                
                
                
                //                    HStack() {
                //
                //                        Image(viewModel.recipes. ?? "")
                //                            .resizable()
                //                            .scaledToFill()
                //                            .frame(width: 35, height: 35)
                //                            .clipShape(Circle())
                //
                //                        VStack(alignment: .leading, spacing: 2) {
                //                            HStack(spacing: 4) {
                //                                Text("By")
                //                                Text("\(recipe.user.firstName) \(recipe.user.familyName)")
                //                                    .fontWeight(.semibold)
                //                            }
                //                            .font(.system(size: 15))
                //
                //                            Text(recipe.user.description)
                //                                .italic(true)
                //                                .font(.system(size: 13))
                //                                .foregroundColor(.gray)
                //
                //                        }
                //                        .frame(maxWidth: .infinity, alignment: .leading)
                //
                //                    }.padding()
                
                //                    Divider().frame(width: 350)
                //
                //                    ForEach(viewModel.recipes) { recipe in
                //                        ZStack {
                //                            NavigationLink(destination: RecipeDetailView(recipe: recipe).navigationBarBackButtonHidden()) {
                //                                EmptyView()
                //
                //                            }
                //                            .opacity(0)
                //
                //                            RecipeCardView(recipe: recipe)
                //                        }
                //
                //                    }
                //                    .listRowSeparator(.hidden)
                //
                //                }
                //                .listStyle(.plain)
                //                .buttonStyle(BorderlessButtonStyle())
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(recipes: DeveloperPreview.shared.recipes)
    }
}
