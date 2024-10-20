//
//  SwiftUiCryptoApp.swift
//  SwiftUiCrypto
//
//  Created by Basith on 08/10/24.
//

import SwiftUI

@main
struct SwiftUiCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
            }
        }
    }
}
