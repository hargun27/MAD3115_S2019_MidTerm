//
//  Mobile.swift
//  C0752452_MidTerm_MAD3115S2019
//
//  Created by Hargun Marya on 2019-07-12.
//  Copyright © 2019 Hargun Marya. All rights reserved.
//

import Foundation
class Mobile: Bill
{
    var mobileManufacturer: String
    var planName: String
    var mobileNumber: String
    var internetUsed: Int
    var minuteUsed: Int
    
    init(Id: Int, billDate: Date, billType: billTypes, totalBillAmount: Float, mobileManufacturer: String, planName: String, mobileNumber: String, internetUsed: Int, minuteUsed: Int)
    {
        self.mobileManufacturer = mobileManufacturer
        self.planName = planName
        self.mobileNumber = mobileNumber
        self.internetUsed = internetUsed
        self.minuteUsed = minuteUsed
        
        super.init(Id: Id, billDate: billDate, billType: billType, totalBillAmount: totalBillAmount)
    }
    
}
