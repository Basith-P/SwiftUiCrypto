//
//  CircleButtonAnimationView.swift
//  SwiftUiCrypto
//
//  Created by Basith on 20/10/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1 : 0)
            .opacity(animate ? 0 : 1)
            .animation(
                animate ? Animation.easeInOut(duration: 1) : .none,
                value: animate
            )
 
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
}
