//
//  SwiftUiCryptoApp.swift
//  SwiftUiCrypto
//
//  Created by Basith on 08/10/24.
//

import SwiftUI

@main
struct SwiftUiCryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
