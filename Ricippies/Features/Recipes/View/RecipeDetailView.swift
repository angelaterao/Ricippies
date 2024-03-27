//
//  RecipeView.swift
//  Ricippies
//
//  Created by Angela Terao on 10/01/2024.
//


import SwiftUI

struct RecipeDetailView: View {
    
    @StateObject var viewModel: RecipeDetailViewModel
    
//    let recipe: Recipe
    
    init(recipe: Recipe) {
        _viewModel = StateObject(wrappedValue: RecipeDetailViewModel(recipe: recipe))
    }
    
    var body: some View {
        ScrollView {
            VStack() {
                
                HeaderView(recipe: viewModel.recipe)
                
                ActionsBannerView()
                
                ProfileBannerView(recipe: viewModel.recipe)
                
                RicippieInfoBannerView(recipe: viewModel.recipe)
                
                IngredientsView(viewModel: viewModel)
                
                StepsView(recipe: viewModel.recipe)
                
//                CommentView()
                
            }
        }
        .ignoresSafeArea()
        .scrollIndicators(.hidden)
    }
}



struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: DeveloperPreview.shared.recipes[0])
    }
}

struct HeaderView: View {
    
    @Environment(\.dismiss) var dismiss
    let recipe: Recipe
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            ZStack(alignment: .topLeading) {
                ImageCarouselView(recipe: recipe)
                    .frame(height: 280)
                
                DismissButton(dismiss: _dismiss)
            }
            
            Text(recipe.name)
                .foregroundColor(.white)
                .font(.title)
                .bold()
                .offset(y: -30)
                .padding(10)
                .shadow(radius: 10.0, x: -10.0, y: -10.0)

        }
    }
}

struct ActionsBannerView: View {
    
    var body: some View {
        Spacer(minLength: 20)
        
        HStack() {
            Image(systemName: "heart")
            Text("15k")
            
            Image(systemName: "bubble.left")
            Text("3k")
            
            Image(systemName: "bookmark")
            Text("Save")
            
            Image(systemName: "square.and.arrow.up")
            Text("Share")
        }
        .font(.subheadline)
        
        Spacer(minLength: 20)
        
        Divider().frame(width: 350)
    }
}

struct ProfileBannerView: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack() {
            
            ProfilePhotoView(urlString: recipe.user.imageURL ?? "")
            
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 4) {
                    Text("By")
                    Text("\(recipe.user.firstName) \(recipe.user.familyName)")
                        .fontWeight(.semibold)
                }
                .font(.system(size: 15))
                
                Text(recipe.user.description)
                    .italic(true)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }.padding()
        
        Divider().frame(width: 350)
    }
}

struct RicippieInfoBannerView: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack(spacing: 15) {
            
            VStack(spacing: 3) {
                Text("Difficulty")
                    .fontWeight(.semibold)
                Text(recipe.difficultyLevel.title)
            }
            
            Divider()
            
            VStack(spacing: 3) {
                Text("Cooking time")
                    .fontWeight(.semibold)
                Text("\(recipe.cookingTime) min")
            }
            
            Divider()
            
            VStack(spacing: 3) {
                Text("Baking time")
                    .fontWeight(.semibold)
                Text("\(recipe.bakingTime) min")
            }
            
        }
        .padding(8)
        .font(.system(size: 16))
        
        Divider().frame(width: 350)
    }
    
}

struct IngredientsView: View {
    
    @ObservedObject var viewModel: RecipeDetailViewModel
    
    @State private var initialNumServings: Int
    
    init(viewModel: RecipeDetailViewModel) {
        self.viewModel = viewModel
        _initialNumServings = State(initialValue: viewModel.recipe.numServings)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.headline)
                .fontWeight(.semibold)
            
            Stepper {
                Text("\(viewModel.recipe.numServings) servings")
            } onIncrement: {
                viewModel.incrementServings()
            } onDecrement: {
                viewModel.decrementServings()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                ForEach(viewModel.recipe.ingredients) { ingredient in
                    
                    HStack(spacing: 5) {
                        HStack(spacing: 10) {
                            VStack(alignment: .leading) {
                                Text("\(viewModel.calculateNewAmount(for: ingredient, numServings: viewModel.recipe.numServings, initialNumServings: initialNumServings))")
                            }
                            .fontWeight(.semibold)
                            
                            VStack(alignment: .leading)  {
                                Text("\(ingredient.measure.title)")
                            }
                        }
                        .frame(width: 85, height: 0, alignment: .leading)
                        
                        VStack(alignment: .leading)  {
                            Text("\(ingredient.name)")
                        }
                    }
                }
            }
        }
        .padding()
        
        Divider().frame(width: 350)
    }
}

struct StepsView: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                
                Text("Preparation Steps")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer(minLength: 20)
                
                ForEach(recipe.preparationSteps) { step in
                    Text("Step")
                    Spacer()
                    Text(step.description)
                        .font(.subheadline)
                    Spacer(minLength: 20)
                }
            }
            
            Spacer()
            
        }.padding()
        
        Divider().frame(width: 200)
    }
}

struct CommentView: View {
    
    private var images = ["homemadepizza1",
                  "homemadepizza2",
                  "homemadepizza3", "homemadepizza1",
                          "homemadepizza2",
                          "homemadepizza3"]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("What others say")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text("3k comments")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button("Read") {
                    print("Trying to read comments")
                }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
            }
            .padding()
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(images, id: \.self ) { image in
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
            }
            
            Spacer()
            
        }
        
    }
    
}
