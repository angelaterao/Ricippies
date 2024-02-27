//
//  User.swift
//  Ricippies
//
//  Created by Angela Terao on 12/02/2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: Int
    var firstName: String
    var familyName: String
    var description: String
    var imageURL: String?
    var email: String
}
