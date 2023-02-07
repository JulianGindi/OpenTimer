//
//  TimerView.swift
//  OpenTimer
//
//  Created by Julian Gindi on 2/7/23.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        VStack {
            Text("30 minutes")
                .font(.title)
                .multilineTextAlignment(.center)
            Circle()
                .fill(.blue)
                .frame(width: 300, height: 300)
            Circle()
                .trim(from: 0, to: 0.5)
                .stroke(.blue, lineWidth: 20)
                .frame(width: 200, height: 200)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
