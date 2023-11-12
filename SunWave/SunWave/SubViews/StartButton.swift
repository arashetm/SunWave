//
//  StartButton.swift
//  SunWave
//
//  Created by Arash on 11/13/23.
//

import SwiftUI

struct StartButton: View {
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("start".capitalized)
                .frame(maxWidth: .infinity)
                .bold()
                .font(.title3)
        }
        .padding()
        .foregroundStyle(Color.white)
        .background(Color.background)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .padding(.horizontal)
    }
}
