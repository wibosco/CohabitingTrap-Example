import Foundation

struct Wishlist {
    let products: [Product]
    private let calculator = TotalCalculator()

    var total: Decimal {
        let total = calculator.calculateTotal(for: products,
                                              applyThreeForTwoOffer: false,
                                              applyOutOfStockFilter: true,
                                              applyDeliveryCharge: false)

        return total
    }
}
