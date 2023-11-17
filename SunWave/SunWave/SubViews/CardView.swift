//
//  CardView.swift
//  SunWave
//
//  Created by Mehdi Karami on 11/13/23.
//

import SwiftUI

// MARK: - Card View
struct CardView: View {
    // Private
    @State private var timer: Timer? = nil
    @State private var incrementalPercent = 0.0
    
    // Public
    var viewModel: SunWaveViewModel
    @Binding var isResetAnimation: Bool
    var maxHeight = 200.0
    
    var body: some View {
        VStack(spacing: 16) {
            ChartView(startPoint: viewModel.startPoint,
                      endPoint: viewModel.endPoint,
                      threshold: incrementalPercent)
            
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
            .bold()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(Color.background)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding(16)
        .frame(maxHeight: maxHeight)
        .onChange(of: isResetAnimation) {
            if isResetAnimation {
                resetAnimation()
            }
        }
    }
}

// MARK: - Private Methods
private extension CardView {
    func resetAnimation() {
        incrementalPercent = 0
        
        timer?.invalidate()
        timer = nil
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            guard incrementalPercent < viewModel.threshold else {
                timer.invalidate()
                isResetAnimation = false
                return
            }
            incrementalPercent += 0.003
        }
    }
}

// MARK: - Card View Preview
#Preview("Card View") {
    CardView(viewModel: SunWaveViewModel(startPoint: -Double.pi / 2, endPoint: Double.pi * 3/2, threshold: 0.2), isResetAnimation: .constant(false))
}
