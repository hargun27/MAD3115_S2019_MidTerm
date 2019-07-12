//
//  Hydro.swift
//  C0752452_MidTerm_MAD3115S2019
//
//  Created by Hargun Marya on 2019-07-12.
//  Copyright © 2019 Hargun Marya. All rights reserved.
//

import Foundation
class Hydro: Bill
{
    var agencyName: String
    var unitconsumed: Int
    
    init(Id: Int, billDate: Date, billType: billTypes, totalBillAmount: Float, agencyName: String, unitconsumed: Int)
    {
        self.agencyName = agencyName
        self.unitconsumed = unitconsumed
        
        super.init(Id: Id, billDate: billDate, billType: billType, totalBillAmount: totalBillAmount)
    }
    
}
