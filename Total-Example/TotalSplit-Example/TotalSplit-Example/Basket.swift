//
//  Basket.swift
//  TotalSplit-Example
//
//  Created by William Boles on 04/10/2026.
//

import Foundation

struct Basket {
    let products: [Product]

    var total: Decimal {
        let inStockProducts = products
                                .filter { $0.isInStock }

        let sum = inStockProducts.reduce(0) { $0 + $1.price }

        let cheapest = inStockProducts
                        .map { $0.price }
                        .min() ?? 0
        let discount = inStockProducts.count >= 3 ? cheapest : 0

        let subtotal = sum - discount

        let deliveryCharge: Decimal = subtotal < 50 ? 4 : 0

        let total = subtotal + deliveryCharge

        return total
    }
}
