//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Ahmed Shoman on 4/24/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
struct CoinModel {
    var bitCoinValue: Double
    var currencyValue:String
    var bitCoinValueString: String{
        let stringBitCoin = String(format: "%.1f", bitCoinValue)
        return stringBitCoin
    }
    
}



