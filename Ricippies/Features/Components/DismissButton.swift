//
//  DismissButton.swift
//  Ricippies
//
//  Created by Angela Terao on 17/01/2024.
//

import SwiftUI

struct DismissButton: View {
    @Environment(\.dismiss) var dismiss
    
    var imageName: String?
    var frameWidth: CGFloat? = 32
    var frameHeight: CGFloat? = 32
    var padding: CGFloat?
    var offsetY: CGFloat?
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: imageName ?? "chevron.left")
                .foregroundColor(.black)
                .background(Circle()
                    .fill(.white)
                    .frame(width: frameWidth, height: frameHeight))
                .padding(padding ?? 35)
                .offset(y: offsetY ?? 20)
        }
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
