//
//  SunWaveView.swift
//  SunWave
//
//  Created by Arash on 11/11/23.
//

import SwiftUI

struct SunWaveView: View {
    var viewModel: SunWaveViewModel
    
    @State private var timer: Timer? = nil
    @State private var incrementalPercent: Double = 0
    
    private var cardInfoView: some View {
        VStack(spacing: 16) {
            ChartView(startPoint: viewModel.startPoint, endPoint: viewModel.endPoint, threshold: incrementalPercent)
            
            InfoView
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(Color.background)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .padding(16)
        
    }
    
    private var InfoView: some View {
        HStack {
            InfoDetailView(imageSystemName: "sunrise",
                           imageSide: .right,
                           title: "sunrise".capitalized,
                           time: "8:10 am")
            
            
            Spacer()
            
            InfoDetailView(imageSystemName: "sunset",
                           imageSide: .left,
                           title: "sunset".capitalized,
                           time: "4:02 pm")
            
            
        }
        .font(.title)
        .fontWeight(.bold)
    }
    
    var body: some View {
        VStack {
            Spacer()
            cardInfoView
                .frame(maxHeight: 200)
            Spacer()
            StartButton {
                resetAnimation()
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .padding(.bottom)
        .background(Color.rainy)
    }
}

private extension SunWaveView {
    func resetAnimation() {
        incrementalPercent = 0
        timer?.invalidate()
        timer = nil
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            guard incrementalPercent < 0.7 else {
                timer.invalidate()
                return
            }
            incrementalPercent += 0.003
        }
    }
}

#Preview {
    SunWaveView(viewModel: SunWaveViewModel(startPoint: -Double.pi / 2, endPoint: Double.pi * 3/2, threshold: 0.7))
}
