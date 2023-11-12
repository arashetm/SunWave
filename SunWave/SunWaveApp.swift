//
//  SunWaveApp.swift
//  SunWave
//
//  Created by Arash on 11/11/23.
//

import SwiftUI

@main
struct SunWaveApp: App {
    var body: some Scene {
        WindowGroup {
            SunWaveView(viewModel: SunWaveViewModel(startPoint: -Double.pi / 2, endPoint: Double.pi * 3/2, threshold: 0.7))
        }
    }
}
