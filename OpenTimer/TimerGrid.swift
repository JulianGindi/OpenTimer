//
//  TimerGrid.swift
//  OpenTimer
//
//  Created by Julian Gindi on 2/10/23.
//

import SwiftUI

struct TimerGrid: View {
    var body: some View {
        Grid {
            GridRow {
                TimerView(timerAmount: 30)
            }
        }
        .frame(width: 10.0, height: 10.0)
    }
}

struct TimerGrid_Previews: PreviewProvider {
    static var previews: some View {
        TimerGrid()
    }
}
