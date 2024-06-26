//
//  OrderStruct.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import Foundation

struct Orders{
    var productName: String?
    var orderDate: String?
    var deliveryDate: String?
    var deliveryAddress: String?
    var productQuantity: String?
    var orderStatus: OrderStatus?
    var productImage: String
    
    init(productName: String? = nil, orderDate: String? = nil, deliveryDate: String? = nil, deliveryAddress: String? = nil, productQuantity: String? = nil, orderStatus: OrderStatus? = .pending, productImage: String) {
        self.productName = productName
        self.orderDate = orderDate
        self.deliveryDate = deliveryDate
        self.deliveryAddress = deliveryAddress
        self.productQuantity = productQuantity
        self.orderStatus = orderStatus
        self.productImage = productImage
    }
    
    func orderStatusValue() -> String{
        switch orderStatus {
            case .pending : return "Pending"
            case .dispatched: return "Dispatched"
            case .delivered: return "Delivered"
            default: return "nil"
        }
    }
}

enum OrderStatus{
    case pending
    case dispatched
    case delivered
}
