//
//  DeveloperPreview.swift
//  Ricippies
//
//  Created by Angela Terao on 31/01/2024.
//

//This is the mock data

import Foundation

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    
    var recipes: [Recipe] = [
        .init(
//            id: NSUUID().uuidString,
            id: 1,
            name: "Easy Homemade Pizza",
            imageURLs: ["homemadepizza1",
                        "homemadepizza2",
                        "homemadepizza3"],
            user: .init(id: 1,
                        firstName: "Angela",
                        familyName: "Terao",
                        description: "El que no come bien, come mal",
                        imageURL: "profilepicture",
                        email: "ang.terter@gmail.com"),
            numServings: 4,
            ingredients: [.init(id: 1,
                                name: "flour",
                                amount: 200,
                                measure: .gr),
                          .init(id: 2,
                                name: "water",
                                amount: 100,
                                measure: .ml),
                          .init(id: 3,
                                name: "salt",
                                amount: 1,
                                measure: .tbsp),
                          .init(id: 4,
                                name: "fast rise yeast",
                                amount: 2,
                                measure: .tsp),
                          .init(id: 5,
                                name: "oil",
                                amount: 1,
                                measure: .tbsp)],
            preparationSteps: [.init(id: 1,
                                     description: "In large bowl, mix first 4 ingredients. Mix water and oil and add to flour mixture. Turn onto floured surface; knead for 2 minutes. Place in a greased bowl; turning to grease top. Cover and let rise for 20 minutes."),
                               .init(id: 2,
                                     description: "Punch down; place on 12in, greased pizza pan. Pat into a circle. Put a few pepperoni slices on top of sauce. Sprinkle with 1/2 the mozzeralla; 1/2 the monterey jack, and 1/2 the parmesan. Put the rest of the pepperoni on. Repeat the cheese layer. Bake at 400* for 20 minutes or until light brown. "),
                               .init(id: 3,
                                     description: "Mix again and again.")],
            difficultyLevel: .medium,
            cookingTime: 50,
            bakingTime: 20,
            isFavourite: false,
            isLiked: false),
        .init(
            id: 2,
            name: "Best Lasagna",
            imageURLs: ["bestlasagna1",
                        "bestlasagna2"],
            user: .init(id: 2,
                        firstName: "Emeric",
                        familyName: "DP",
                        description: "On mange quand?",
                        imageURL: "profilepicture2",
                        email: "em.dp@gmail.com"),
            numServings: 4,
            ingredients: [.init(id: 6,
                                name: "ground beef",
                                amount: 500,
                                measure: .gr),
                          .init(id: 7,
                                name: "tomato paste",
                                amount: 2,
                                measure: .tbsp),
                          .init(id: 8,
                                name: "lasagna noodles",
                                amount: 400,
                                measure: .gr),
                          .init(id: 9,
                                name: "ricotta cheese",
                                amount: 85,
                                measure: .gr),
                          .init(id: 10,
                                name: "mozarella cheese",
                                amount: 1,
                                measure: .medium)],
            preparationSteps: [.init(id: 4,
                                     description: "Put a large pot of salted water (1 tablespoon of salt for every 2 quarts of water) on the stovetop on high heat. It can take a while for a large pot of water to come to a boil (this will be your pasta water), so prepare the sauce in the next steps while the water is heating."),
                               .init(id: 5,
                                     description: "In a large skillet heat 2 teaspoons of olive oil on medium-high heat. Add the ground beef and cook until it is lightly browned on all sides. Remove the beef with a slotted spoon to a bowl. Drain off all but a tablespoon of fat."),
                               .init(id: 6,
                                     description: "Do the rest..")],
            difficultyLevel: .difficult,
            cookingTime: 90,
            bakingTime: 15,
            isFavourite: false,
            isLiked: false)
            
    ]
    
}
