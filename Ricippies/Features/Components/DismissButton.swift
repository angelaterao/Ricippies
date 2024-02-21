//
//  DismissButton.swift
//  Ricippies
//
//  Created by Angela Terao on 17/01/2024.
//

import SwiftUI

struct DismissButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
                .background(Circle()
                    .fill(.white)
                    .frame(width: 32, height: 32))
                .padding(35)
                .offset(y: 20)
        }
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
