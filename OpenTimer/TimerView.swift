//
//  TimerView.swift
//  OpenTimer
//
//  Created by Julian Gindi on 2/7/23.
//

import SwiftUI

struct TimerView: View {
    @State var timerAmount: Float = 60.0 // In seconds
    @State var startTimer = false
    @State private var completionAmount = 1.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    var tickCount: Double {
        let totalTicks = timerAmount / 0.1
        return 1.0 / Double(totalTicks)
    }
    
    var body: some View {
        VStack {
            Text("\(Int(timerAmount)) seconds")
                .font(.title)
                .multilineTextAlignment(.center)
            Circle()
                .trim(from: 0.0, to: completionAmount)
                .stroke(.blue, lineWidth: 20)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
                .onReceive(timer) { _ in
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
            Button {
                startTimer = true
            } label: {
                Text("Start")
                    .padding(20)
            }
            .contentShape(Rectangle())
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
