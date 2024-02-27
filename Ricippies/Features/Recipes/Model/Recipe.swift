//
//  Recipe.swift
//  Ricippies
//
//  Created by Angela Terao on 22/01/2024.
//

import Foundation
import SwiftUI

struct Recipe: Identifiable, Codable, Hashable {
    let id: Int
    var name: String
    var imageURLs: [String]
    let user: User
    var numServings: Int
    var ingredients: [Ingredient]
    var preparationSteps: [PreparationStep]
    var difficultyLevel: Difficulty
    var cookingTime: Int
    var bakingTime: Int
    var isFavourite: Bool
    var isLiked: Bool
//    let comments: [Comment]
}

struct Ingredient: Identifiable, Codable, Hashable {
    let id: Int
    var name: String
    var amount: Double
    var measure: Measure
}

struct PreparationStep: Identifiable, Codable, Hashable {
    let id: Int
    var description: String
}

enum Difficulty: String, Codable, Identifiable, Hashable, CaseIterable {
    case easy
    case medium
    case difficult
    
    var title: String {
        switch self {
        case .easy: return "Easy"
        case .medium: return "Medium"
        case .difficult: return "Difficult"
        }
    }
    
    var id: String { return self.title }
}

enum Measure: String, Codable, Identifiable, Hashable, CaseIterable {
    case gr
    case ml
    case tsp
    case tbsp
    case cup
    case small
    case medium
    case large
    case pound
    case ounces
    
    var title: String {
        switch self {
        case .gr: return "gr"
        case .ml: return "ml"
        case .tsp: return "tsp"
        case .tbsp: return "tbsp"
        case .cup: return "cup"
        case .small: return "small"
        case .medium: return "medium"
        case .large: return "large"
        case .pound: return "pound"
        case .ounces: return "ounces"
        }
    }
    
    var id: String { return self.title }
}

//struct Comment: Identifiable, Codable, Hashable {
//    let id: Int
//    var commentBody: String
//    var commentImageURLs: [String]
//}
