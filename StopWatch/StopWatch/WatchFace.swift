//
//  WatchFace.swift
//  StopWatch
//
//  Created by Nazeer Greene on 7/9/21.
//

import SwiftUI

struct WatchFace: View {
    var seconds: Double
    let secondsPerMin: Int = 60
    let minutesPerRotation = 12
    let secondsHandWidth: CGFloat = 7
    let secondsHandsHeight: CGFloat = 165
    //these values are the (width, height) of the
    //hands: minutesWidth == secondsWidth,
    //minutesHeight == secondsHeight * 2/3
    
    var body: some View {
        
        ZStack {
            Image("watchface")
                .resizable()
                //.aspectRatio(contentMode: .fit)
                .scaledToFit()
            
            //second hand
            Rectangle()
                .foregroundColor(Color.black.opacity(0.3))
                .frame(width: secondsHandWidth, height: secondsHandsHeight, alignment: .center)
                //offset is necessary to keep the hands at the
                //center of the clock
                .offset(x: 0, y: -80)
                //each completed min is a full 360 deg.
                .rotationEffect(Angle.degrees(360 * seconds/Double(secondsPerMin)))
            
            //minute hand
            Rectangle()
                .foregroundColor(Color.black.opacity(0.4))
                .frame(width: secondsHandWidth, height: secondsHandsHeight * 0.67 , alignment: .center)
                .offset(x: 0, y: -55)
                //(secondsPerMin*minutesPerRotation)==(60*12)
                //is the number of seconds before one
                //complete rotation occurs
                //so therefore (60*1) is "1";
                //and (60*2) is "2"; (60*12) is "12",
                //or one complete rotation, so forth
                .rotationEffect(Angle.degrees(
                360 * seconds/Double((secondsPerMin*minutesPerRotation))
                ))
        } //end of zstack
    } //end of body
}

struct WatchFace_Previews: PreviewProvider {
    static var previews: some View {
        WatchFace(seconds: 60)
        WatchFace(seconds: 2*60)
        WatchFace(seconds: 0)

    }
}
