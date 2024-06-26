//
//  protocols.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import Foundation
import UIKit

protocol QuantityDelegate {
    func addQuantity(index: Int)
    func substractQuantity(index: Int)
    func showQuantityTotal()
}

protocol OrderListingDelegate {
    func placeOrder(checkoutData: CheckoutDetails)
}

protocol SaveAddress{
    func saveUserAddress(address: String, type: String)
}
