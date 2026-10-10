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
            Product(price: 60,
                    isInStock: true),
            Product(price: 45,
                    isInStock: false),
            Product(price: 30,
                    isInStock: true)
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

    // These totals record what `TotalCalculator` does today, not what it should do - only two of the eight combinations have a caller to say what is right.
    @Test("Given no flags, when a total is calculated, then every product is charged for")
    func noFlagsChargesEveryProduct() {
        let products = [
            Product(price: 20,
                    isInStock: true),
            Product(price: 15,
                    isInStock: false),
            Product(price: 10,
                    isInStock: true)
        ]

        let sut = TotalCalculator()

        let total = sut.calculateTotal(for: products,
                                       applyThreeForTwoOffer: false,
                                       applyOutOfStockFilter: false,
                                       applyDeliveryCharge: false)

        #expect(total == 45)
    }

    @Test("Given only the delivery charge, when a total is calculated, then £4 delivery is added")
    func deliveryChargeIsAddedUnder50() {
        let products = [
            Product(price: 20,
                    isInStock: true),
            Product(price: 15,
                    isInStock: false),
            Product(price: 10,
                    isInStock: true)
        ]

        let sut = TotalCalculator()

        let total = sut.calculateTotal(for: products,
                                       applyThreeForTwoOffer: false,
                                       applyOutOfStockFilter: false,
                                       applyDeliveryCharge: true)

        #expect(total == 49)
    }

    @Test("Given only the out-of-stock filter, as Wishlist asks for, when a total is calculated, then out-of-stock products are left out")
    func outOfStockFilterLeavesOutOutOfStockProducts() {
        let products = [
            Product(price: 20,
                    isInStock: true),
            Product(price: 15,
                    isInStock: false),
            Product(price: 10,
                    isInStock: true)
        ]

        let sut = TotalCalculator()

        let total = sut.calculateTotal(for: products,
                                       applyThreeForTwoOffer: false,
                                       applyOutOfStockFilter: true,
                                       applyDeliveryCharge: false)

        #expect(total == 30)
    }

    @Test("Given the out-of-stock filter and delivery charge, when a total is calculated, then out-of-stock products are left out and £4 delivery is added")
    func outOfStockFilterAndDeliveryCharge() {
        let products = [
            Product(price: 20,
                    isInStock: true),
            Product(price: 15,
                    isInStock: false),
            Product(price: 10,
                    isInStock: true)
        ]

        let sut = TotalCalculator()

        let total = sut.calculateTotal(for: products,
                                       applyThreeForTwoOffer: false,
                                       applyOutOfStockFilter: true,
                                       applyDeliveryCharge: true)

        #expect(total == 34)
    }

    @Test("Given only the three-for-two offer, when a total is calculated, then the cheapest product is free")
    func threeForTwoOfferMakesCheapestFree() {
        let products = [
            Product(price: 20,
                    isInStock: true),
            Product(price: 15,
                    isInStock: false),
            Product(price: 10,
                    isInStock: true)
        ]

        let sut = TotalCalculator()

        let total = sut.calculateTotal(for: products,
                                       applyThreeForTwoOffer: true,
                                       applyOutOfStockFilter: false,
                                       applyDeliveryCharge: false)

        #expect(total == 35)
    }

    @Test("Given the three-for-two offer and delivery charge, when a total is calculated, then the cheapest product is free and £4 delivery is added")
    func threeForTwoOfferAndDeliveryCharge() {
        let products = [
            Product(price: 20,
                    isInStock: true),
            Product(price: 15,
                    isInStock: false),
            Product(price: 10,
                    isInStock: true)
        ]

        let sut = TotalCalculator()

        let total = sut.calculateTotal(for: products,
                                       applyThreeForTwoOffer: true,
                                       applyOutOfStockFilter: false,
                                       applyDeliveryCharge: true)

        #expect(total == 39)
    }

    @Test("Given the three-for-two offer and out-of-stock filter, when a total is calculated, then the cheapest product is free and out-of-stock products are left out")
    func threeForTwoOfferAndOutOfStockFilter() {
        let products = [
            Product(price: 20,
                    isInStock: true),
            Product(price: 15,
                    isInStock: false),
            Product(price: 10,
                    isInStock: true)
        ]

        let sut = TotalCalculator()

        let total = sut.calculateTotal(for: products,
                                       applyThreeForTwoOffer: true,
                                       applyOutOfStockFilter: true,
                                       applyDeliveryCharge: false)

        #expect(total == 20)
    }

    @Test("Given every flag, as Basket asks for, when a total is calculated, then the cheapest product is free, out-of-stock products are left out and £4 delivery is added")
    func allFlagsApplied() {
        let products = [
            Product(price: 20,
                    isInStock: true),
            Product(price: 15,
                    isInStock: false),
            Product(price: 10,
                    isInStock: true)
        ]

        let sut = TotalCalculator()

        let total = sut.calculateTotal(for: products,
                                       applyThreeForTwoOffer: true,
                                       applyOutOfStockFilter: true,
                                       applyDeliveryCharge: true)

        #expect(total == 24)
    }
}
