//
//  ButtonImage.swift
//  StopWatch
//
//  Created by Nazeer Greene on 7/9/21.
//

import SwiftUI

struct ButtonImage: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.system(size: 30))
            .padding(.horizontal, 70.0)
            .padding(.vertical, 15)
            .background(Color.blue.opacity(0.5))
            .cornerRadius(60)
    }
}

struct ButtonImage_Previews: PreviewProvider {
    static var previews: some View {
        ButtonImage(text: "Start")
    }
}
