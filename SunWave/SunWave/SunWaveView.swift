//
//  SunWaveView.swift
//  SunWave
//
//  Created by Arash on 11/11/23.
//

import SwiftUI

// MARK: - Sun Wave View
struct SunWaveView: View {
    // Private
    @State private var isResetAnimation = false

    // Public
    var viewModel: SunWaveViewModel

    var body: some View {
        VStack {
            Spacer()
            
            CardView(viewModel: viewModel, isResetAnimation: $isResetAnimation)
            
            Spacer()
            
            StartButton {
                isResetAnimation = true
            }
        }
        .padding(.bottom)
        .background(Color.rainy)
    }
}

// MARK: - Sun Wave View Preview
#Preview("Sun Wave View") {
    SunWaveView(viewModel: SunWaveViewModel(startPoint: -Double.pi / 2,
                                            endPoint: Double.pi * 3/2,
                                            threshold: 0.7))
}
