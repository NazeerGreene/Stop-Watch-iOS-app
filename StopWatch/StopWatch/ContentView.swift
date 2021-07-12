//
//  ContentView.swift
//  StopWatch
//
//  Created by Nazeer Greene on 7/8/21.
//

import SwiftUI

struct ContentView: View {
    
    //ObservedObject necessary for view to re-render
    //StopWatchManager
    @ObservedObject var swm: WatchManager = WatchManager()
    //false == textual representation
    //true == graphical representation
    @State private var face: Bool = false
    
    var body: some View {
        VStack {
            
            Toggle("\tSwitch Face", isOn: $face)
            
            Spacer()
            
            
            GeometryReader { geometry in
                VStack {//Timer Display: Textual or Graphic
                    if face == false {
                        Text("\(swm.elapsedSeconds, specifier: "%.2f")")
                            .font(.title)
                            .font(.system(size: 100))
                            .padding()
                    } else {
                        WatchFace(seconds: swm.elapsedSeconds)
                    }
                }//end of display vstack
                .frame(width: geometry.size.width, height: geometry.size.width * 0.65)
            }

            Spacer()
            
            //Laps Display
            VStack(alignment: .leading) {
                Text("\tLaps")
                    .font(.title3)
                
                List {
                    ForEach(self.swm.laps, id: \.self) { lap in
                        Text("\(lap, specifier: "%.2f")")

                    } //end of foreach
                } //end of list
                .border(Color.gray)
            } //end of vstack

            //Adaptive buttons (adapts based on Timer mode)
            Group {
                
                //Initial display
                if swm.watchState == .inactive {
                    Button( action: {
                        swm.begin()
                    }, label: {
                        ButtonImage(text: "Start")
                        
                    })
                } //end of .inactive conditional
                
                //Running watch
                if swm.watchState == .active {
                    
                    DualButtons(firstText: "Lap",
                                firstAction: {
                                    swm.lap()
                                },
                                secondText: "Pause",
                                secondAction: {
                                    swm.pause()
                                })
                } //end of active
                
                //Paused watch
                if swm.watchState == .paused {
                    
                    DualButtons(firstText: "Reset",
                                firstAction: {
                                    swm.reset()
                                },
                                secondText: "Start",
                                secondAction: {
                                    swm.begin()
                                })
                } //end of .paused conditional
            } //end of button group
            .padding()
            
        } //end of outermost vstack
    } //end of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
