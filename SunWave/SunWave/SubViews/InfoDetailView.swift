//
//  InfoDetailView.swift
//  SunWave
//
//  Created by Arash on 11/13/23.
//

import SwiftUI

struct InfoDetailView: View {
    @Environment(\.layoutDirection) var direction: LayoutDirection
    
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
