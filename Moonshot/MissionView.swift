//
//  MissionView.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 18/10/24.
//

import SwiftUI
import VersaUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronauts: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack (spacing: 32) {
                
                // Image container
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                }
                .padding(24)
                .frame(maxWidth:.infinity)
                .background(RoundedRectangle(cornerRadius:10).fill(VersaColor.Neutral.Background.secondary).stroke(VersaColor.Neutral.Border.subtle, lineWidth: 1))
                
                // Astonauts Container
                VStack (alignment: .leading, spacing: 12) {
                    Text("Crews")
                        .font(.title2.bold())
                        .foregroundStyle(VersaColor.Neutral.Text.primary)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack (spacing: 16) {
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink {
                                    Text("Astronaut Detail Page")
                                } label: {
                                    HStack (alignment: .top, spacing: 0) {
                                        Image(crewMember.astronauts.id)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .padding(6)
                                        
                                        VStack (alignment: .leading, spacing: 4) {
                                            Text(crewMember.astronauts.name)
                                                .foregroundStyle(VersaColor.Neutral.Text.primary)
                                                .font(.headline)
                                            Text(crewMember.role)
                                                .foregroundStyle(VersaColor.Neutral.Text.secondary)
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
                        }
                    }
                    
                }
                
                Divider()

                // Text Container
                VStack (alignment: .leading, spacing: 12) {
                    Text("Mission Highlight")
                        .font(.title2.bold())
                        .foregroundStyle(VersaColor.Neutral.Text.primary)
                    
                    Text(mission.description)
                        .foregroundStyle(VersaColor.Neutral.Text.secondary.opacity(0.8))
                        .lineSpacing(2)
                }
            }
            .padding([.horizontal, .top], 16)
            .padding(.bottom, 24)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(VersaColor.Neutral.Background.primary)
    }
    
    // Custom initializer
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
    
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronauts: astronaut)
            } else {
                fatalError("We couldn't find an astronaut for \(member.name).")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[0], astronauts: astronauts)
}
