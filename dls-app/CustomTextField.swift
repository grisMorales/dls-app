//
//  CustomTextField.swift
//  dls-app
//
//  Created by Griselda Morales on 12/07/23.
//

import SwiftUI
import dls_framework

struct PlaceholderColorKey: EnvironmentKey {
    static var defaultValue: Color = Color(UIColor.darkGray)
}

extension EnvironmentValues {
    var placeholderColor: Color {
        get { return self[PlaceholderColorKey.self] }
        set { self[PlaceholderColorKey.self] = newValue }
    }
}

struct CustomTextField: View {
    
    let placeholder: String
    let isSecure: Bool
    @Binding var text: String
    @Environment(\.placeholderColor) var placeholderColor
    
    var body: some View {
        ZStack(
            alignment: .leading,
            content: {
                if text.isEmpty == true {
                    Text(placeholder)
                    .foregroundColor(placeholderColor)
                }
                if isSecure {
                    SecureField("", text: $text)
                } else {
                    TextField("", text: $text)
                }
            }
        )
    }
}

private struct PlaceholderColorModifier: ViewModifier {
    @Environment(\.theme) var theme
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.colorSchemeContrast) var colorContrast
    let style: ColorStyle
    
    func body(content: Content) -> some View {
        content.placeholderColor(
            theme.adaptiveColor(
                style,
                isDarkMode: colorScheme == .dark,
                prefersHighContrast: colorContrast == .increased
            )
        )
    }
}

extension View {
    func placeholderColor(_ color: Color) -> some View {
        self.environment(\.placeholderColor, color)
    }
    
    func placeholderColor(_ style: ColorStyle) -> some View {
        self.modifier(PlaceholderColorModifier(style: style))
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(
            placeholder: "Email",
            isSecure: false,
            text: .constant("")
        )
        .padding()
        .placeholderColor(.red)
    }
}
