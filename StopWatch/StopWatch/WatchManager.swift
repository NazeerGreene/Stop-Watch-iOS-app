//
//  WatchManager.swift
//  StopWatch
//
//  Created by Nazeer Greene on 7/8/21.
//

import SwiftUI

//ObservableObject necessary to render new view
//whenever a Published value is modified
class WatchManager: ObservableObject {
    
    //Keep track of watch state
    //to render buttons appropriately
    enum states {
        case active
        case paused
        case inactive
    }
    
    //@Published will inform the view to re-render when the value changes
    //Change view to update new time
    @Published var elapsedSeconds: Double = 0.0
    //Change view to update based on state of watch manager
    @Published var watchState: states = .inactive
    var laps: [Double] = []
    let timeInterval: Double = 0.1
    var timer = Timer()
    
    
    
    func begin() -> Void {
        watchState = .active
        
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            self.elapsedSeconds += self.timeInterval
        }
    } //end of begin
    
    func pause() -> Void {
        watchState = .paused
        timer.invalidate()
    } //end of pause
    
    func reset() -> Void {
        //this wipes the board complete,
        //as if it's an entirely new object
        watchState = .inactive
        timer.invalidate()
        elapsedSeconds = 0.0
        laps.removeAll()
    } //end of end
    
    func lap() -> Void {
        laps.append(elapsedSeconds)
        print(laps)
    }
}
