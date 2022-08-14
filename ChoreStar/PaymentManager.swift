//
//  Store.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import StoreKit
import SwiftUI

class PaymentManager: ObservableObject {
    var products = [Product]()
    
    func fetch() async {
        Task {
            do {
                products = try await Product.products(for: ["com.temporary.test","com.temporary.test2", "com.temporary.test4"])
                print("PRODUCTS:")
                print(products)
            } catch {
                print(error)
            }
        }
    }
    
    func purchase(tag: String = "test4") async {
        Task {
            guard let product = products.first(where: {$0.displayName == tag}) else {
                print("NO PRODUCT NAMED \(tag). \(products)")
                return
            }
            do {
                let result = try await product.purchase()
                print(result)
            } catch {
                print(error)
            }
        }
    }
}
