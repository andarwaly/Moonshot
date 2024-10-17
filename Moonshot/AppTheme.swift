//
//  AppTheme.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 17/10/24.
//

import SwiftUI

enum AppTheme: String {
    case light
    case dark
    
    // Define how each theme looks
    var colorScheme: ColorScheme {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

struct ThemeSwitcher: View {
    @AppStorage("selectedTheme") private var selectedTheme: String = AppTheme.light.rawValue
    
    var body: some View {
        Picker("Select Theme", selection: $selectedTheme) {
            Text("Light").tag(AppTheme.light.rawValue)
            Text("Dark").tag(AppTheme.dark.rawValue)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

struct ThemeModifier: ViewModifier {
    var theme: AppTheme
    
    func body(content: Content) -> some View {
        content
            .preferredColorScheme(theme.colorScheme)
    }
}

extension View {
    func applyTheme(_ theme: AppTheme) -> some View {
        self.modifier(ThemeModifier(theme: theme))
    }
}
