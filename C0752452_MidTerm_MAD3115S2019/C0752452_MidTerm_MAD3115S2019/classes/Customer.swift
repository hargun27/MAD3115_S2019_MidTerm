//
//  Customer.swift
//  C0752452_MidTerm_MAD3115S2019
//
//  Created by Hargun Marya on 2019-07-12.
//  Copyright © 2019 Hargun Marya. All rights reserved.
//

import Foundation
class Customer{
    

static var activeCustomer = Customer()
var customerId : String
var firstName : String
var lastName: String

var fullName: String // computed variable
{
    return "\(self.firstName) \(self.lastName)"
}
var email: String

var billDictionary = [Int:Bill]()

var TotalAmountToPay: Float // computed variable
{
    var TotalAmount: Float = 0.0
    
    for bill in billDictionary
    {
        TotalAmount = TotalAmount + bill.value.totalBillAmount
    }
    return TotalAmount
}
    init()
    {
        self.customerId = String()
        self.firstName = String()
        self.lastName = String()
        self.email = String()
    }
}
