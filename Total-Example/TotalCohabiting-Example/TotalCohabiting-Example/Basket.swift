import Foundation

struct Basket {
    let products: [Product]
    private let calculator = TotalCalculator()

    var total: Decimal {
        let total = calculator.calculateTotal(for: products,
                                              applyMultibuy: true,
                                              skipOutOfStock: true,
                                              includeDelivery: true)

        return total
    }
}
