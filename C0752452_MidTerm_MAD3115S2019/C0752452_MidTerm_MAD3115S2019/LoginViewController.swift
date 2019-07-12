//
//  LoginViewController.swift
//  C0752452_MidTerm_MAD3115S2019
//
//  Created by Hargun Marya on 2019-07-11.
//  Copyright © 2019 Hargun Marya. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textEmailId: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var switchRememberMe: UISwitch!
    var UserDict = [UsersStruct]()
    let UserDefault = UserDefaults.standard
    override func viewDidLoad() {
        switchRememberMe.isOn = false
        getRememberMe()
       
        
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    @IBAction func btnLoginPressed(_ sender: UIBarButtonItem)
    {
        self.checkLogin()
    }
    
    func checkLogin()
    {
        if let email = textEmailId.text{
            if !email.isEmpty{
                
                if email.isValidEmail(){
                    if let password = textPassword.text{
                        if !password.isEmpty{
                            if password.sizeCheck(){
                                
                              //  if  checkEmailPassword(email: email, password: password) //{
                                if switchRememberMe.isOn {
                                    UserDefault.set(self.textEmailId.text, forKey: "email")
                                    UserDefault.set(self.textPassword.text, forKey: "password")
                                }else{
                                    UserDefault.set("", forKey: "email")
                                    UserDefault.set("", forKey: "password")
                                }
                                
                                    
                                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                    let dashboardVC = storyboard.instantiateViewController(withIdentifier: "BillVC") as! BillListTableTableViewController
                                    
                                    self.present(dashboardVC, animated: true, completion: nil)                                    //self.navigationController?//.pushViewController(dashboardVC, animated: //true)
                                    
                                    
                               // }else{
                                 //   showAlerBox(msg: "You have enter wrong //credentials")
                              //  }
                                
                            }else{
                                showAlerBox(msg: "Invalid password")
                            }
                            
                        }else{
                            showAlerBox(msg: "Please enter password")
                        }
                    }
                }
                else{
                    showAlerBox(msg: "Please enter valid email")
                }
            }else{
                showAlerBox(msg: "Please enter useremail")
            }
        }
    }
    func readCustomersPlistFile(){
        
        let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let Customers = dict["Users"] as? [[String:Any]]
            {
                for customer in Customers {
                    let id = customer["userID"] as! Int
                    let firstName = customer["userName"] as! String
                    
                    let email = customer["email"] as! String
                    let password = customer["password"] as! String
                    
                    self.UserDict.append(UsersStruct(userID: id, userName: firstName, email: email, password: password))
                }
            }
        }
        
    }
   
    func checkEmailPassword(email : String , password : String) -> Bool{
        
        for everyCustomer in UserDict{
            if (everyCustomer.email == email && everyCustomer.password == password) {
                return true
            }
        }
        return false
    }
 /*   func setRememberMe()  {
        if switchRememberMe.isOn {
            UserDefault.set(self.textEmailId.text, forKey: "email")
            UserDefault.set(self.textPassword.text, forKey: "password")
        }else{
            UserDefault.set("", forKey: "email")
            UserDefault.set("", forKey: "password")
        }
    }*/
    
    func getRememberMe()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "email")
        {
            textEmailId.text = email
            
            if let password = userDefault.string(forKey: "password")
            {
                textPassword.text = password
                switchRememberMe.setOn(true, animated: false)
            }
        }
    }
    
    
    func showAlerBox(msg : String)  {
        let alertController = UIAlertController(title: "CustomerBill", message:
            msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func unWindLogoutFromAnyScreen(storyboardSegue: UIStoryboardSegue)
    {
        _ = storyboardSegue.source as! BillListTableTableViewController
        textPassword.text = ""
        textEmailId.text = ""
    }
}

    
    
    

