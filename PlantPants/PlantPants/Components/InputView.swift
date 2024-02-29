//
//  InputView.swift
//  PlantPants
//
//  Created by Andrew Julian Gonzales on 2/26/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text:String
    let placeHolder:String
    var isSecureField = false
    
    var body: some View {
        if isSecureField {
            SecureField(placeHolder, text: $text)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 355, height: 50)
                .scaledToFit()
                .background(Color(.systemGray6))
                .cornerRadius(10)
        }else {
            TextField(placeHolder, text: $text)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 355, height: 50)
                .scaledToFit()
                .background(Color(.systemGray6))
                .cornerRadius(10)
        }
    }
}

struct InputView_Preview: PreviewProvider{
    static var previews: some View {
        InputView(text: .constant(""), placeHolder: "Email", isSecureField: false)
    }
}

