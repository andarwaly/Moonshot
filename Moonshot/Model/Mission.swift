//
//  Mission.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 17/10/24.
//

import Foundation


struct Mission: Codable, Identifiable {
    // Nested instance -> karena hanya digunakan pada misison struct
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    // Computed Properties
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
