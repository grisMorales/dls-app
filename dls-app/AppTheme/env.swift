//
//  EnvTheme.swift
//  dls-app
//
//  Created by Griselda Morales on 12/07/23.
//

import SwiftUI
import dls_framework

struct ThemeKey: EnvironmentKey {
    static var defaultValue: ThemeProvider = appTheme
}

extension EnvironmentValues {
    var theme: ThemeProvider {
        get { return self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}
