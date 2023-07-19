//
//  View.swift
//  dls-app
//
//  Created by Griselda Morales on 12/07/23.
//

import SwiftUI
import dls_framework

private struct ColorModifier: ViewModifier {
    
    @Environment(\.theme) var theme
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.colorSchemeContrast) var colorContrast
   // @Environment(\.marca) var marca
    
    private var isDark: Bool {
        return colorScheme == .dark
    }
    
    private var isHighContrast: Bool {
        return colorContrast == .increased
    }
    
    enum Placement {
        case foreground
        case background
    }
    
    let style: ColorStyle
    let placement: Placement
  
    @ViewBuilder
    func body(content: Content) -> some View {
        switch placement {
        case .foreground:
            content.foregroundColor(
                theme.adaptiveColor(
                    style,
                    isDarkMode: isDark,
                    prefersHighContrast: isHighContrast
                )
            )
        case .background:
            content.background(
                theme.adaptiveColor(
                    style,
                    isDarkMode: isDark,
                    prefersHighContrast: isHighContrast
                )
            )
        }
    }
}

/*private struct FontModifier: ViewModifier {
    
    @Environment(\.theme) var theme
    @Environment(\.sizeCategory) var contentSize
    @Environment(\.legibilityWeight) var fontLegibility
    
    private var isBoldText: Bool {
        return fontLegibility == .bold
    }
    
    let style: FontStyle
    
    func body(content: Content) -> some View {
        return content
        .font(
            theme.adaptiveFont(
                style,
                contentSize: contentSize,
                prefersBoldText: isBoldText
            )
        )
    }
}*/


extension View {
    
    func adaptiveForegroundColor(_ style: ColorStyle) -> some View {
        self.modifier(ColorModifier(style: style, placement: .foreground))
    }
    
    func adaptiveBackgroundColor(_ style: ColorStyle) -> some View {
        self.modifier(ColorModifier(style: style, placement: .background))
    }

  /*  func adaptiveFont(_ style: FontStyle) -> some View {
        self.modifier(FontModifier(style: style))
    }*/
}
