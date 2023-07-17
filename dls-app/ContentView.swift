//
//  ContentView2.swift
//  dls-app
//
//  Created by Griselda Morales on 12/07/23.
//

import SwiftUI

struct ContentView2: View {
   
    @Environment(\.theme) var theme
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.colorSchemeContrast) var colorContrast
    @Environment(\.sizeCategory) var contentSize
    @Environment(\.legibilityWeight) var fontLegibility
    
    private var isDark: Bool {
        return colorScheme == .dark
    }
    
    private var isHighContrast: Bool {
        return colorContrast == .increased
    }
    
    private var isBoldText: Bool {
        return fontLegibility == .bold
    }
    
    @State var email = ""
    
    var body: some View {
        VStack {
            Text("System Adapting")
                .foregroundColor(.primary)
                .background(Color(UIColor.systemBackground))
                .font(.body)
                .padding()
            
            Text("Non Adapting")
                .padding()
                .foregroundColor(.black)
                .background(Color.white)
                .font(Font(UIFont(name: "Helvetica", size: 18)!))
            
            Text("Theme Adapting")
                .padding()
                .foregroundColor(Color(theme.adaptiveColor(.textPrimary, isDarkMode: isDark, prefersHighContrast: isHighContrast)))
                .background(Color(theme.adaptiveColor(.backgroundPrimary, isDarkMode: isDark, prefersHighContrast: isHighContrast)))
            //    .font(theme.adaptiveFont(.title, contentSize: contentSize, prefersBoldText: isBoldText))
             
            
             Text("Theme Adapting 2")
                 .padding()
                 .adaptiveForegroundColor(.textPrimary)
                 .adaptiveBackgroundColor(.backgroundPrimary)
             //    .adaptiveFont(.body)
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
