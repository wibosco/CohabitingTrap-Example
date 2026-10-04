import Foundation

final class TotalCalculator {

    func calculateTotal(for products: [Product],
                        applyMultibuy: Bool,
                        skipOutOfStock: Bool,
                        includeDelivery: Bool) -> Decimal {
        let pricedProducts = skipOutOfStock ? products.filter { $0.isInStock } : products
        let sum = pricedProducts.reduce(0) { $0 + $1.price }

        let cheapest = products
                        .map { $0.price }
                        .min() ?? 0
        let discount = applyMultibuy && products.count >= 3 ? cheapest : 0

        let subtotal = sum - discount

        let deliveryCharge: Decimal = includeDelivery && subtotal < 50 ? 4 : 0

        let total = subtotal + deliveryCharge

        return total
    }
}
