//
//  Configuration.swift
//  TotalCohabiting-ExampleTests
//
//  Created by William Boles on 04/10/2026.
//

import Foundation

@testable import TotalCohabiting_Example

func makeProduct(price: Decimal,
                 isInStock: Bool = true) -> Product {
    Product(price: price,
            isInStock: isInStock)
}
