//
//  Store.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import StoreKit
import SwiftUI

class ViewModel: ObservableObject {
    var products = [Product]()
    
    func fetch() async {
        Task {
            do {
                products = try await Product.products(for: ["com.temporary.test","com.temporary.test2"])
                print("PRODUCTS:")
                print(products)
            } catch {
                print(error)
            }
        }
    }
    
    func purchase(tag: String) async {
        Task {
            guard let product = products.first(where: {$0.displayName == tag}) else {
                print("NO PRODUCT NAMED THAT")
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
