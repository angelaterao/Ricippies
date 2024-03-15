//
//  PhotoSelectorView.swift
//  Ricippies
//
//  Created by Angela Terao on 06/03/2024.
//

import SwiftUI
import PhotosUI

struct PhotoSelectorView: View {
    
    @StateObject var photoSelectorViewModel = PhotoSelectorViewModel()
    
    let maxPhotosToSelect = 5
    
    var body: some View {
        
        VStack {
            PhotosPicker(selection: $photoSelectorViewModel.selectedPhotos, maxSelectionCount: maxPhotosToSelect, selectionBehavior: .ordered, matching: .images) {
                
                if photoSelectorViewModel.images.count == 0 {
                    Image("addPhotosDefaultImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    TabView {
                        ForEach(0..<photoSelectorViewModel.images.count, id: \.self) { index in
                            Image(uiImage: photoSelectorViewModel.images[index])
                                .resizable()
                                .scaledToFill()
                        }
                    }
                    .tabViewStyle(.page)
                }
            }
        }
        .onChange(of: photoSelectorViewModel.selectedPhotos) { _ in
            photoSelectorViewModel.convertDataToImage()
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(30)
        
    }
}

struct PhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSelectorView()
    }
}
