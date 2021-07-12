//
//  MiniButtonImage.swift
//  StopWatch
//
//  Created by Nazeer Greene on 7/9/21.
//

import SwiftUI

struct MiniButtonImage: View {
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width: 130, height: 67, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .font(.system(size: 30))
            .fixedSize(horizontal: true, vertical: true)
            .background(Color.blue.opacity(0.5))
            .cornerRadius(60)
    }
}

struct MiniButtonImage_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            MiniButtonImage(text: "Start")
            MiniButtonImage(text: "Reset")
        }
    }
}
