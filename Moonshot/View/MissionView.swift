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
                        .foregroundStyle(VersaColor.Neutral.Foreground.primary)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack (spacing: 16) {
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronauts)
                                } label: {
                                    MissionPageLayout(
                                        image: crewMember.astronauts.id,
                                        member: crewMember.astronauts.name,
                                        role: crewMember.role
                                    )
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
                        .foregroundStyle(VersaColor.Neutral.Foreground.primary)
                    
                    Text(mission.description)
                        .foregroundStyle(VersaColor.Neutral.Foreground.secondary.opacity(0.8))
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
