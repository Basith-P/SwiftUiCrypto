//
//  HomeView.swift
//  SwiftUiCrypto
//
//  Created by Basith on 08/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                homeHeader
                
                coloumnTitles
                
                if (showPortfolio) {
                    portfolioList
                        .transition(.move(edge: .trailing))
                } else {
                    coinsList
                    .transition(.move(edge: .leading))
                }
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
            .toolbar(.hidden  )
    }
    .environmentObject(DeveloperPreview.instance.homeVm) 
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus": "info")
                .animation(.none, value: showPortfolio)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio":"Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }
    }
    
    private var coloumnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if (showPortfolio) {Text("Holdings")}
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
    
    private var coinsList: some View {
        List {
            ForEach(vm.coins) { coin in
                CoinListItem(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 8))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinListItem(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 8))
            }
        }
        .listStyle(PlainListStyle())
    }
}
