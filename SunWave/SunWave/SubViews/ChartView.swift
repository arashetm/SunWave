//
//  ChartView.swift
//  SunWave
//
//  Created by Arash on 11/13/23.
//

import SwiftUI
import Charts

struct ChartView: View {
    let startPoint: Double
    let endPoint: Double
    let threshold: Double
    
    @State private var didAppeared: Bool = false
    
    var body: some View {
        let striddenRange = Array(stride(from: startPoint, to: endPoint, by: 0.1))
        let visibleRange = 2 * Double.pi * threshold
        
        Chart {
            // Dashed
            ForEach(striddenRange, id: \.self) { step in
                LineMark(x: .value("X", step),
                         y: .value("Sin(x)", sin(step)),
                         series: .value("Group", "Dashed"))
                .lineStyle(.init(dash: [5]))
                .foregroundStyle(.gray)
            }
            
            // Animatabel
            ForEach(striddenRange, id: \.self) { step in
                if step + Double.pi / 2 <= visibleRange {
                    LineMark(x: .value("X", step),
                             y: .value("Sin(x)", sin(step)),
                             series: .value("Group", "Animatable"))
                    .foregroundStyle(Color.primaryPurple)
                    .cornerRadius(10)
                    .lineStyle(StrokeStyle(lineWidth: 3))
                }
            }
            
            // Marker
            let xMarker = -Double.pi / 2 + visibleRange
            
            LineMark(x: .value("xMarker", xMarker),
                     y: .value("yMarker", sin(xMarker)))
            .symbol {
                Image(systemName: "sun.max.fill")
                    .frame(width: 15, height: 15)
                    .foregroundStyle(.orange)
                    .symbolEffect(.bounce.up.wholeSymbol, options: .repeating.speed(0.2), value: didAppeared)
                    .onAppear() {
                        didAppeared.toggle()
                    }
            }
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
    }
}
