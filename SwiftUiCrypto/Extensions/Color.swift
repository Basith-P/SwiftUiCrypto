//
//  Color.swift
//  SwiftUiCrypto
//
//  Created by Basith on 08/10/24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent  = Color("AccentColor")
    let background = Color("BackgroundColor")
    let appGreen = Color("GreenColor")
    let appRed = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
