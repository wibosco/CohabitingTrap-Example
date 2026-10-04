//
//  BasketTests.swift
//  TotalSplit-ExampleTests
//
//  Created by William Boles on 04/10/2026.
//

import Foundation
import Testing

@testable import TotalSplit_Example

struct BasketTests {

    @Test("Given a basket with an out-of-stock product, when it is totalled, then that product doesn't count towards three-for-two")
    func outOfStockProductDoesNotCountTowardsThreeForTwo() {
        let products = [
            makeProduct(price: 60),
            makeProduct(price: 45,
                        isInStock: false),
            makeProduct(price: 30)
        ]

        let sut = Basket(products: products)

        #expect(sut.total == 90)
    }

    @Test("Given a basket with three in-stock products, when it is totalled, then the cheapest is free")
    func cheapestOfThreeIsFree() {
        let products = [
            makeProduct(price: 60),
            makeProduct(price: 45),
            makeProduct(price: 30)
        ]

        let sut = Basket(products: products)

        #expect(sut.total == 105)
    }

    @Test("Given a basket worth less than £50, when it is totalled, then delivery is charged")
    func deliveryIsCharged() {
        let products = [
            makeProduct(price: 20),
            makeProduct(price: 10)
        ]

        let sut = Basket(products: products)

        #expect(sut.total == 34)
    }

    @Test("Given a basket worth £50, when it is totalled, then delivery is free")
    func deliveryIsFree() {
        let products = [
            makeProduct(price: 30),
            makeProduct(price: 20)
        ]

        let sut = Basket(products: products)

        #expect(sut.total == 50)
    }
}
