//
//  InfoDetailView.swift
//  SunWave
//
//  Created by Arash on 11/13/23.
//

import SwiftUI

// MARK: - Info Detail View
struct InfoDetailView: View {
    var imageSystemName: String
    var imageSide: Side
    var title: String
    var time: String
    
    enum Side {
        case left, right
    }
    
    var body: some View {
        HStack {
            Image(systemName: imageSystemName)
                .foregroundStyle(Color.primaryPurple)
            
            VStack(spacing: 0) {
                Text(verbatim: title)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.gray)
                
                Text(verbatim: time)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
            }
        }
        .environment(\.layoutDirection, imageSide == .left ? .leftToRight : .rightToLeft)
    }
}

// MARK: - Info Detail View Preview
#Preview("Info Detail View") {
    InfoDetailView(imageSystemName: "sunrise",
                   imageSide: .right,
                   title: "sunrise".capitalized,
                   time: "8:10 am")
}
