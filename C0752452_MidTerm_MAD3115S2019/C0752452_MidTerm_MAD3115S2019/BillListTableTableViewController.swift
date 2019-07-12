//
//  BillListTableTableViewController.swift
//  C0752452_MidTerm_MAD3115S2019
//
//  Created by Hargun Marya on 2019-07-11.
//  Copyright © 2019 Hargun Marya. All rights reserved.
//

import UIKit

class BillListTableTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var customerList = [UsersStruct]()
    var customerArray = Array<Customer>()
    @IBOutlet weak var tbl_users: UITableView!
    
    @IBAction func btn_logout(_ sender: Any)
    {
        self.performSegue(withIdentifier: "LogoutS", sender: nil)
        
}
    override func viewDidLoad() {
        super.viewDidLoad()
        readCustomersPlistFile()
        
        
        let b1: Mobile = Mobile(Id: 1, billDate: Date(), billType: billTypes.Mobile, totalBillAmount: 70.50, mobileManufacturer: "abc", planName: "Talk + Data", mobileNumber: "+4356278766", internetUsed: 23, minuteUsed: 34)
       
        let cust1: Customer = Customer(customerId: "1", firstName: "hargun", lastName: "marya", email: "hargun@gmail.com")
        
        cust1.billDictionary[1] = b1
       
        
       
        
        customerArray = [cust1]
        self.tbl_users.delegate = self
        self.tbl_users.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func readCustomersPlistFile(){
        
        let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let customers = dict["Users"] as? [[String:Any]]
            {
                for customer in customers {
                    let id = customer["userID"] as! Int
                    let firstName = customer["userName"] as! String
                    
                    let email = customer["email"] as! String
                    let password = customer["password"] as! String
                    
                    self.customerList.append(UsersStruct(userID: id, userName: firstName, email: email, password: password))
                }
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell")  as! UITableViewCell
        
        cell.textLabel?.text = self.customerArray[indexPath.row].fullName
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBtnAction(_:)))
        cell.tag = indexPath.row
        cell.addGestureRecognizer(tapGesture)
        return cell
    }
    
    @objc func tapBtnAction(_ sender: UITapGestureRecognizer) {
        print(sender.view!.tag)
        Customer.activeCustomer = self.customerArray[(sender.view?.tag)!]
        self.performSegue(withIdentifier: "GoToDetailS", sender: self)
    }
    
}


