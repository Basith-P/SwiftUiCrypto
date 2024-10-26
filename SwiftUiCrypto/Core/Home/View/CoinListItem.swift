//
//  CoinListItem.swift
//  SwiftUiCrypto
//
//  Created by Basith on 20/10/24.
//

import SwiftUI

struct CoinListItem: View {
    
    let coin: Coin
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing:0) {
            leftCol
            Spacer()
            if showHoldingsColumn { centerCol }
            rightCol
        }
        .font (.subheadline)
    }
}

#Preview (traits: .sizeThatFitsLayout) {
    Group{
        CoinListItem(coin: DeveloperPreview.instance.coin, showHoldingsColumn: true)
            .preferredColorScheme(.light)
        
        CoinListItem(coin: DeveloperPreview.instance.coin, showHoldingsColumn: true)
            .preferredColorScheme(.dark)
    }
}

extension CoinListItem{
    private var leftCol: some View {
        HStack(spacing:0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
        }
    }
    
    private var centerCol: some View {
        VStack (alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2DecimalPlaces())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle(Color.theme.accent)
    }
    
    private var rightCol: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6DecimalPlaces())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "-")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.appGreen: Color.theme.appRed
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
