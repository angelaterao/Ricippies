//
//  FeedView.swift
//  Ricippies
//
//  Created by Angela Terao on 13/12/2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 33) {
                    ForEach(0...10, id: \.self) { listing in
                        ListingView()
                    }
                }
            }
            .navigationTitle("Feed")
            .padding()
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
