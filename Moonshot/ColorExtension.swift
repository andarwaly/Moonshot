//
//  ColorExtension.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 17/10/24.
//

import SwiftUI
import VersaUI

extension ShapeStyle where Self == Color {
    static var bgPrimary: Color {
        VersaColor.Neutral.Background.primary
    }

    static var bgSecondary: Color {
        VersaColor.Neutral.Background.secondary
    }
}
