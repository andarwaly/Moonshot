//
//  GridView.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 20/10/24.
//

import SwiftUI
import VersaUI


struct MissionGridView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    let isAdaptiveGrid: Bool
    
    // Namespace for the matched geometry effect
    @Namespace private var animationNamespace
    
    var body: some View {
        LazyVGrid(columns: createGridItems(), spacing: 12) {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    
                    Group {
                        // Card Container
                        if isAdaptiveGrid {
                            VerticalCard(padding: 0) {
                                MissionCardLayout(
                                    isAdaptive: isAdaptiveGrid, image: mission.image,
                                    title: mission.displayName,
                                    subtitle: mission.formattedLaunchDate
                                )
                                .matchedGeometryEffect(id: mission.id, in: animationNamespace)
                            }
                            .transition(
                                .asymmetric(
                                    insertion: .scale.combined(with: .opacity),
                                    removal: .opacity
                                )
                            )
                        } else {
                           VerticalCard(padding: 0) {
                                MissionCardLayout(
                                    isAdaptive: isAdaptiveGrid,
                                    image: mission.image,
                                    title: mission.displayName,
                                    subtitle: mission.formattedLaunchDate
                                )
                                .matchedGeometryEffect(id: mission.id, in: animationNamespace)
                            }
                            .transition(
                                .asymmetric(
                                    insertion: .scale
                                        .combined(with: .move(edge: .leading)),
                                    removal: .opacity
                                )
                            )
                        }
                    }
                }
            }
        }
        .padding(16)
        .animation(.snappy, value: isAdaptiveGrid)
    }
    
    // Helper method to create the grid layout based on the state of isAdaptiveGrid
    private func createGridItems() -> [GridItem] {
        if isAdaptiveGrid {
            return [GridItem(.adaptive(minimum: 160), spacing: 12)]
        } else {
            return Array(repeating: GridItem(.flexible(), spacing: 12), count: 1)
        }
    }
}
