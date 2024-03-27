//
//  ProfilePhotoView.swift
//  Ricippies
//
//  Created by Angela Terao on 25/03/2024.
//

import SwiftUI

struct ProfilePhotoView: View {
    
    var urlString: String
    var frameWidth: CGFloat? = 35
    var frameHeight: CGFloat? = 35
    
    var body: some View {
        AsyncImage(url: URL(string: urlString), content: { phase in
            switch phase {
                case .empty:
                    ZStack {
                        Color.white
                        ProgressView()
                    }
                case .success(let image):
                    image.resizable()
                case .failure:
                Image("profilepicture")
                    .resizable()
                @unknown default:
                    EmptyView()
            }
        })
        .scaledToFill()
        .frame(width: frameWidth, height: frameHeight)
        .clipShape(Circle())
    }
}

struct ProfilePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoView(urlString: "")
    }
}
