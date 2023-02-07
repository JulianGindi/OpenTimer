//
//  TimerView.swift
//  OpenTimer
//
//  Created by Julian Gindi on 2/7/23.
//

import SwiftUI

struct TimerView: View {
    @State private var completionAmount = 1.0
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("1 minutes")
                .font(.title)
                .multilineTextAlignment(.center)
            Circle()
                .trim(from: 0.0, to: completionAmount)
                .stroke(.blue, lineWidth: 20)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
                .onReceive(timer) { _ in
                    withAnimation {
                        if completionAmount == 0.0 {
                            // Play a notification sound and display some text
                        } else {
                            completionAmount -= 0.02
                        }
                    }
                }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
