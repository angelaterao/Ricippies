//
//  RicippiesApp.swift
//  Ricippies
//
//  Created by Angela Terao on 13/12/2023.
//

import SwiftUI

@main
struct RicippiesApp: App {
    
//    let viewModelFactory = ViewModelFactory()
    
    var body: some Scene {
        WindowGroup {
            RicippiesTabView()
//                .environmentObject(viewModelFactory)
        }
    }
}
