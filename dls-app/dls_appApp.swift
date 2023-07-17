//
//  dls_appApp.swift
//  dls-app
//
//  Created by Griselda Morales on 11/07/23.
//

import SwiftUI

@main
struct dls_appApp: App {
    var body: some Scene {
        WindowGroup {
            // SignInView is SwiftUI
            SignInView()
            // RegisterView is in UIKit
//            RegisterView()
            .environment(\.theme, appTheme)
        }
    }
}
