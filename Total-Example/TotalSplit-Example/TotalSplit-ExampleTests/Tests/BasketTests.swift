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
            Product(price: 60,
                    isInStock: true),
            Product(price: 45,
                    isInStock: false),
            Product(price: 30,
                    isInStock: true)
        ]

        let sut = Basket(products: products)

        #expect(sut.total == 90)
    }

    @Test("Given a basket with three in-stock products, when it is totalled, then the cheapest is free")
    func cheapestOfThreeIsFree() {
        let products = [
            Product(price: 60,
                    isInStock: true),
            Product(price: 45,
                    isInStock: true),
            Product(price: 30,
                    isInStock: true)
        ]

        let sut = Basket(products: products)

        #expect(sut.total == 105)
    }

    @Test("Given a basket worth less than £50, when it is totalled, then delivery is charged")
    func deliveryIsCharged() {
        let products = [
            Product(price: 20,
                    isInStock: true),
            Product(price: 10,
                    isInStock: true)
        ]

        let sut = Basket(products: products)

        #expect(sut.total == 34)
    }

    @Test("Given a basket worth £50, when it is totalled, then delivery is free")
    func deliveryIsFree() {
        let products = [
            Product(price: 30,
                    isInStock: true),
            Product(price: 20,
                    isInStock: true)
        ]

        let sut = Basket(products: products)

        #expect(sut.total == 50)
    }
}
