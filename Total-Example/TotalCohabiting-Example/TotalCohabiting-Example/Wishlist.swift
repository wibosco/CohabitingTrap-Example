import Foundation

struct Wishlist {
    let products: [Product]
    private let calculator = TotalCalculator()

    var total: Decimal {
        let total = calculator.calculateTotal(for: products,
                                              applyMultibuy: false,
                                              skipOutOfStock: true,
                                              includeDelivery: false)

        return total
    }
}
