//
//  MissionPageLayout.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 20/10/24.
//

import SwiftUI
import VersaUI

struct MissionPageLayout: View {
    let image: String
    let member: String
    let role: String
    
    var body: some View {
        HStack (alignment: .top, spacing: 0) {
            Image("\(image)")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(6)
            
            VStack (alignment: .leading, spacing: 4) {
                Text("\(member)")
                    .foregroundStyle(VersaColor.Neutral.Foreground.primary)
                    .font(.headline)
                Text("\(role)")
                    .foregroundStyle(VersaColor.Neutral.Foreground.secondary)
                    .font(.subheadline)
            }
            .padding([.vertical, .trailing], 12)
            .padding(.leading, 6)
            
        }
        .background(RoundedRectangle(cornerRadius: 8)
            .fill(VersaColor.Neutral.Background.secondary)
            .stroke(VersaColor.Neutral.Border.subtle, lineWidth: 1))
    }
}
