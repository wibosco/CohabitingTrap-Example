//
//  TotalCalculatorTests.swift
//  TotalCohabiting-ExampleTests
//
//  Created by William Boles on 04/10/2026.
//

import Foundation
import Testing

@testable import TotalCohabiting_Example

struct TotalCalculatorTests {

    @Test("Given a basket with an out-of-stock product, when it is totalled, then that product doesn't count towards three-for-two")
    func outOfStockProductDoesNotCountTowardsThreeForTwo() {
        let products = [
            makeProduct(price: 60),
            makeProduct(price: 45,
                        isInStock: false),
            makeProduct(price: 30)
        ]

        let sut = TotalCalculator()

        let total = sut.calculateTotal(for: products,
                                       applyThreeForTwoOffer: true,
                                       applyOutOfStockFilter: true,
                                       applyDeliveryCharge: true)

        // Left failing on purpose: this is the bug the post is built around, with `total` coming back as `60`.
        withKnownIssue {
            #expect(total == 90)
        }
    }

    @Test("Given a configuration, when a total is calculated, then it matches what TotalCalculator does today",
          arguments: Configuration.all)
    func totalMatchesWhatTotalCalculatorDoesToday(for configuration: Configuration) {
        let products = [
            makeProduct(price: 20),
            makeProduct(price: 15,
                        isInStock: false),
            makeProduct(price: 10)
        ]

        let sut = TotalCalculator()

        let total = sut.calculateTotal(for: products,
                                       applyThreeForTwoOffer: configuration.applyThreeForTwoOffer,
                                       applyOutOfStockFilter: configuration.applyOutOfStockFilter,
                                       applyDeliveryCharge: configuration.applyDeliveryCharge)

        #expect(total == configuration.totalToday)
    }
}
