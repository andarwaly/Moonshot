//
//  MissionCardLayout.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 19/10/24.
//

import SwiftUI
import VersaUI

struct MissionCardLayout: View {
   var isAdaptive: Bool
    
    let image: String
    let title: String
    let subtitle: String
    
    var body: some View {
        Group {
            if isAdaptive {
                VStack (spacing: 0) {
                    Image("\(image)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding(24)
                        .frame(maxWidth: .infinity)
                        .background(VersaColor.Neutral.Background.secondary)
                    // Text Container
                    VStack (alignment: .leading, spacing: 6) {
                        Text("\(title)")
                            .font(.headline)
                            .foregroundStyle(VersaColor.Neutral.Foreground.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(subtitle)")
                            .font(.caption)
                            .foregroundStyle(VersaColor.Neutral.Foreground.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                }
            } else {
                HStack (spacing: 0) {
                    Image("\(image)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding(24)
                        .frame(maxWidth: 80)
                        .background(VersaColor.Neutral.Background.secondary)
                    // Text Container
                    VStack (alignment: .leading, spacing: 6) {
                        Text("\(title)")
                            .font(.headline)
                            .foregroundStyle(VersaColor.Neutral.Foreground.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(subtitle)")
                            .font(.caption)
                            .foregroundStyle(VersaColor.Neutral.Foreground.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}
