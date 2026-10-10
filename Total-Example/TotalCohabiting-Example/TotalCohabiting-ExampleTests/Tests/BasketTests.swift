//
//  BasketTests.swift
//  TotalCohabiting-ExampleTests
//
//  Created by William Boles on 04/10/2026.
//

import Foundation
import Testing

@testable import TotalCohabiting_Example

struct BasketTests {

    @Test("Given a basket with an out-of-stock product, when it is totalled, then that product isn't charged for")
    func outOfStockProductIsNotChargedFor() {
        let products = [
            Product(price: 60,
                    isInStock: true),
            Product(price: 45,
                    isInStock: false)
        ]

        let sut = Basket(products: products)

        #expect(sut.total == 60)
    }
}
