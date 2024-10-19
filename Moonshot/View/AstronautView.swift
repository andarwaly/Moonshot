//
//  AstronautView.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 18/10/24.
//

import SwiftUI
import VersaUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack (spacing: 32) {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth:.infinity, maxHeight:300)
                        .clipShape(RoundedRectangle(cornerRadius:10))
                        .background(RoundedRectangle(cornerRadius:10)
                            .stroke(VersaColor.Neutral.Border.subtle, lineWidth: 1))
                VStack(alignment: .leading, spacing: 12){
                    Text("About")
                        .font(.title2.bold())
                        .foregroundStyle(VersaColor.Neutral.Foreground.primary)
                    Text(astronaut.description)
                        .foregroundColor(VersaColor.Neutral.Foreground.secondary.opacity(0.8))
                        .lineSpacing(2)
                }
            }
            .padding([.horizontal, .top], 16)
            .padding(.bottom, 24)
        }
        .background(VersaColor.Neutral.Background.primary)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronaut: astronauts["aldrin"]!)
}
