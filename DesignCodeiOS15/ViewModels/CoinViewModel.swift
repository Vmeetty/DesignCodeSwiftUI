//
//  CoinViewModel.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/26/23.
//

import Foundation
import SwiftUI

class CoinViewModel: ObservableObject {
    @Published var coins: [Coin] = []
    
    @MainActor
    func fetchCoins() async {
        if let url = URL(string: "https://random-data-api.com/api/crypto_coin/random_crypto_coin?size=10") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                coins = try JSONDecoder().decode([Coin].self, from: data)
            } catch {
                print("Error fetching coins >>")
            }
        }
    }
}
