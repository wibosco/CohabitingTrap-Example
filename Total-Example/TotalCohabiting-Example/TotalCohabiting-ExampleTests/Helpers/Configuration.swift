//
//  Configuration.swift
//  TotalCohabiting-ExampleTests
//
//  Created by William Boles on 04/10/2026.
//


import Foundation
import Testing

struct Configuration: Sendable, CustomTestStringConvertible {
    let applyThreeForTwoOffer: Bool
    let applyOutOfStockFilter: Bool
    let applyDeliveryCharge: Bool
    let caller: String?
    let totalToday: Decimal

    var testDescription: String {
        "applyThreeForTwoOffer: \(applyThreeForTwoOffer), applyOutOfStockFilter: \(applyOutOfStockFilter), applyDeliveryCharge: \(applyDeliveryCharge) - asked for by \(caller ?? "nobody")"
    }

    // These totals record what `TotalCalculator` does today, not what it should do - only two of the eight configurations have a caller to say what is right.
    static let all = [
        Configuration(applyThreeForTwoOffer: false,
                      applyOutOfStockFilter: false,
                      applyDeliveryCharge: false,
                      caller: nil,
                      totalToday: 45),
        Configuration(applyThreeForTwoOffer: false,
                      applyOutOfStockFilter: false,
                      applyDeliveryCharge: true,
                      caller: nil,
                      totalToday: 49),
        Configuration(applyThreeForTwoOffer: false,
                      applyOutOfStockFilter: true,
                      applyDeliveryCharge: false,
                      caller: "Wishlist",
                      totalToday: 30),
        Configuration(applyThreeForTwoOffer: false,
                      applyOutOfStockFilter: true,
                      applyDeliveryCharge: true,
                      caller: nil,
                      totalToday: 34),
        Configuration(applyThreeForTwoOffer: true,
                      applyOutOfStockFilter: false,
                      applyDeliveryCharge: false,
                      caller: nil,
                      totalToday: 35),
        Configuration(applyThreeForTwoOffer: true,
                      applyOutOfStockFilter: false,
                      applyDeliveryCharge: true,
                      caller: nil,
                      totalToday: 39),
        Configuration(applyThreeForTwoOffer: true,
                      applyOutOfStockFilter: true,
                      applyDeliveryCharge: false,
                      caller: nil,
                      totalToday: 20),
        Configuration(applyThreeForTwoOffer: true,
                      applyOutOfStockFilter: true,
                      applyDeliveryCharge: true,
                      caller: "Basket",
                      totalToday: 24)
    ]
}
