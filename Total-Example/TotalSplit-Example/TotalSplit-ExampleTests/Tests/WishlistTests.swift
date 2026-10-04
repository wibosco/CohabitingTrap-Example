//
//  WishlistTests.swift
//  TotalSplit-ExampleTests
//
//  Created by William Boles on 04/10/2026.
//

import Foundation
import Testing

@testable import TotalSplit_Example

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

    @Test("Given a wishlist with three in-stock products, when it is totalled, then three-for-two isn't applied")
    func threeForTwoIsNotApplied() {
        let products = [
            makeProduct(price: 60),
            makeProduct(price: 45),
            makeProduct(price: 30)
        ]

        let sut = Wishlist(products: products)

        #expect(sut.total == 135)
    }

    @Test("Given a wishlist worth less than £50, when it is totalled, then delivery isn't charged")
    func deliveryIsNotCharged() {
        let products = [
            makeProduct(price: 20),
            makeProduct(price: 10)
        ]

        let sut = Wishlist(products: products)

        #expect(sut.total == 30)
    }
}
