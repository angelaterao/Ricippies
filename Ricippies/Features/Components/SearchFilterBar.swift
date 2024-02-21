//
//  SearchFilterBar.swift
//  Ricippies
//
//  Created by Angela Terao on 10/01/2024.
//

import SwiftUI

struct SearchFilterBar: View {
    @State private var ricippie = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.small)
            
            TextField("Looking for a ricippie ?", text: $ricippie)
                .font(.subheadline)
        }
        .frame(height: 44)
        .padding(.horizontal)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1.0)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

struct SearchFilterBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchFilterBar()
    }
}
