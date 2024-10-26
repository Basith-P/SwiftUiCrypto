//
//  HomeViewModel.swift
//  SwiftUiCrypto
//
//  Created by Basith on 26/10/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var coins: [Coin] = []
    @Published var portfolioCoins : [Coin] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.coins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
