//
//  ImageCardView.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 18/10/24.
//

import SwiftUI

struct ImageHeadline: View {
    // Image source
    let image: Image
    
    // Properties for customization
    var scaleType: ContentMode = .fit
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var maxWidth: CGFloat? = nil
    var maxHeight: CGFloat? = nil
    var cornerRadius: CGFloat = 0
    var padding: CGFloat = 0
    var hasBackground: Bool = false
    var backgroundColor: Color = .clear
    var strokeColor: Color = .clear
    var strokeWidth: CGFloat = 0
    
    // Container-relative sizing properties
    var useContainerRelativeFrame: Bool = false
    var containerWidthMultiplier: CGFloat? = nil
    var containerSpacing: CGFloat = 0 // New parameter to specify spacing
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: scaleType) // Adjusts scaling mode (fit or fill)
            .applyContainerRelativeFrame(useContainerRelativeFrame, widthMultiplier: containerWidthMultiplier, spacing: containerSpacing)
            .frame(width: width, height: height)
            .frame(maxWidth: maxWidth, maxHeight: maxHeight)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .background(
                hasBackground ?
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .stroke(strokeColor, lineWidth: strokeWidth)
                : nil
            )
            .padding(padding)
    }
}

extension View {
    // Helper method to apply containerRelativeFrame conditionally
    func applyContainerRelativeFrame(
        _ useContainerRelativeFrame: Bool,
        widthMultiplier: CGFloat?,
        spacing: CGFloat
    ) -> some View {
        if useContainerRelativeFrame, let widthMultiplier = widthMultiplier {
            // Using the provided width multiplier to adjust frame relative to container, including spacing
            return AnyView(self.containerRelativeFrame(.horizontal, count: 1, span: Int(widthMultiplier), spacing: spacing))
        } else {
            return AnyView(self)
        }
    }
}
