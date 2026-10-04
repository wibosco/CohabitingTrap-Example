//
//  Wishlist.swift
//  TotalSplit-Example
//
//  Created by William Boles on 04/10/2026.
//

import Foundation

struct Wishlist {
    let products: [Product]

    var total: Decimal {
        let inStockProducts = products
                                .filter { $0.isInStock }

        let total = inStockProducts
                        .reduce(0) { $0 + $1.price }

        return total
    }
}
