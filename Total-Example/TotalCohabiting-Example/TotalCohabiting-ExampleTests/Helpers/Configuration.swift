//
//  Configuration.swift
//  TotalCohabiting-ExampleTests
//
//  Created by William Boles on 04/10/2026.
//


import Foundation
import Testing

struct Configuration: Sendable, CustomTestStringConvertible {
    let applyMultibuy: Bool
    let skipOutOfStock: Bool
    let includeDelivery: Bool
    let caller: String?
    let totalToday: Decimal

    var testDescription: String {
        "applyMultibuy: \(applyMultibuy), skipOutOfStock: \(skipOutOfStock), includeDelivery: \(includeDelivery) - asked for by \(caller ?? "nobody")"
    }

    // These totals record what `TotalCalculator` does today, not what it should do - only two of the eight configurations have a caller to say what is right.
    static let all = [
        Configuration(applyMultibuy: false,
                      skipOutOfStock: false,
                      includeDelivery: false,
                      caller: nil,
                      totalToday: 45),
        Configuration(applyMultibuy: false,
                      skipOutOfStock: false,
                      includeDelivery: true,
                      caller: nil,
                      totalToday: 49),
        Configuration(applyMultibuy: false,
                      skipOutOfStock: true,
                      includeDelivery: false,
                      caller: "Wishlist",
                      totalToday: 30),
        Configuration(applyMultibuy: false,
                      skipOutOfStock: true,
                      includeDelivery: true,
                      caller: nil,
                      totalToday: 34),
        Configuration(applyMultibuy: true,
                      skipOutOfStock: false,
                      includeDelivery: false,
                      caller: nil,
                      totalToday: 35),
        Configuration(applyMultibuy: true,
                      skipOutOfStock: false,
                      includeDelivery: true,
                      caller: nil,
                      totalToday: 39),
        Configuration(applyMultibuy: true,
                      skipOutOfStock: true,
                      includeDelivery: false,
                      caller: nil,
                      totalToday: 20),
        Configuration(applyMultibuy: true,
                      skipOutOfStock: true,
                      includeDelivery: true,
                      caller: "Basket",
                      totalToday: 24)
    ]
}
