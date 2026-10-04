//
//  WishlistTests.swift
//  TotalCohabiting-ExampleTests
//
//  Created by William Boles on 04/10/2026.
//

import Foundation
import Testing

@testable import TotalCohabiting_Example

struct WishlistTests {

    @Test("Given a wishlist with an out-of-stock product, when it is totalled, then that product is left out")
    func outOfStockProductIsLeftOut() {
        let products = [
            makeProduct(price: 60),
            makeProduct(price: 45,
                        isInStock: false),
            makeProduct(price: 30)
        ]

        let sut = Wishlist(products: products)

        #expect(sut.total == 90)
    }
}
