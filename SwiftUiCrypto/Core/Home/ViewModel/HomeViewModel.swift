//
//  HomeViewModel.swift
//  SwiftUiCrypto
//
//  Created by Basith on 26/10/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var coins: [Coin] = []
    @Published var portfolioCoins : [Coin] = []
    
    private let dataService = CoinDataService()
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        bindCoins()
    }
    
    func bindCoins() {
        print("BINDING COINS")
        dataService.$allCoins
            .sink { [weak self] coins in
                self?.coins = coins
            }
            .store(in: &cancellables)
    }
}
