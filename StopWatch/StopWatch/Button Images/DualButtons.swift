//
//  DualButtons.swift
//  StopWatch
//
//  Created by Nazeer Greene on 7/9/21.
//

import SwiftUI

struct DualButtons: View {
    var firstText: String
    var firstAction: () -> Void
    var secondText: String
    var secondAction: () -> Void
    
    var body: some View {
        HStack {

            Button( action: {
                firstAction()
            }, label: {
                MiniButtonImage(text: firstText)
            })
            
            Button( action: {
                secondAction()
            }, label: {
               MiniButtonImage(text: secondText)
            })
        } //end of vstack
    } //end of body
}

struct DualButtons_Previews: PreviewProvider {
    static var previews: some View {
        DualButtons(firstText: "Start", firstAction: {print("first pressed")}, secondText: "Reset", secondAction: {print("second pressed")})
    }
}
