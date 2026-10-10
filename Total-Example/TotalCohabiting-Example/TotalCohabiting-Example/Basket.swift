import Foundation

struct Basket {
    let products: [Product]
    private let calculator = TotalCalculator()

    var total: Decimal {
        let total = calculator.calculateTotal(for: products,
                                              applyThreeForTwoOffer: true,
                                              applyOutOfStockFilter: true,
                                              applyDeliveryCharge: true)

        return total
    }
}
