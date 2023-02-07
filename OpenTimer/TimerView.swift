//
//  TimerView.swift
//  OpenTimer
//
//  Created by Julian Gindi on 2/7/23.
//

import SwiftUI

struct TimerView: View {
    let timerAmount: Float
    @State var timeRemaining: Float = 0.0
    @State var startTimer = false
    @State private var completionAmount = 1.0
    
    // Timers
    let animationTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    let mainTimer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    
    var tickCount: Double {
        let totalTicks = timerAmount / 0.1
        return 1.0 / Double(totalTicks)
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                if startTimer {
                    Text("\(Int(timeRemaining)) seconds")
                        .font(.title)
                        .multilineTextAlignment(.center)
                } else {
                    VStack {
                        Text("\(Int(timerAmount)) seconds")
                            .font(.title)
                            .multilineTextAlignment(.center)
                        Button {
                            startTimer = true
                            timeRemaining = timerAmount
                        } label: {
                            Text("Start")
                                .font(.title)
                        }
                        .padding(.top, 1.0)
                    }
                }
                Circle()
                    .trim(from: 0.0, to: completionAmount)
                    .stroke(.blue, lineWidth: 20)
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                    .onReceive(animationTimer) { _ in
                        // Hook for animating the circle via the `animationTimer`
                        if startTimer {
                            withAnimation {
                                if completionAmount == 0.0 {
                                    // Play a notification sound and display some text
                                } else {
                                    completionAmount -= tickCount
                                }
                            }
                        }
                    }
                    .onReceive(mainTimer) { _ in
                        if startTimer {
                            if timeRemaining > 0.0 {
                                timeRemaining -= 1.0
                            }
                        }
                    }
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerAmount: 60.0)
    }
}
