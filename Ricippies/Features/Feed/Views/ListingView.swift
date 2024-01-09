//
//  ListingView.swift
//  Ricippies
//
//  Created by Angela Terao on 09/01/2024.
//

import SwiftUI

struct ListingView: View {
    
    @State var isFavourite: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Rectangle()
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("Easy Homemade Pizza")
                .fontWeight(.semibold)
                .font(.system(size: 20))
            
            HStack() {
                
                Circle()
                    .frame(height: 35)
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        Text("By")
                        Text("Angela Terao")
                            .fontWeight(.semibold)
                    }
                    .font(.system(size: 15))
                    
                    HStack(spacing: 4) {
                        Text("27 minutes")
                        Text("ago")
                    }
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    
                }
                
                Spacer()
                
                Button {
                    isFavourite.toggle()
                } label: {
                    if isFavourite {
                        Image("bookmark_selected")
                    } else {
                        Image("bookmark")
                    }
                    
                }

            }
            
        }
    }
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingView()
    }
}
