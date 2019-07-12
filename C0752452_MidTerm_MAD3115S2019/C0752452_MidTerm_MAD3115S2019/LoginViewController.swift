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
        getRememberMeValues()
       
        
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    private func getRememberMeValues()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "userEmail")
        {
            textEmailId.text = email
            
            if let password = userDefault.string(forKey: "userPassword")
            {
                textPassword.text = password
                switchRememberMe.setOn(true, animated: false)
            }
            }
        }
    
    }
    
//    @IBAction func btnLogin(_ sender: UIBarButtonItem) {
//        if self.textEmailId.text == "admin@gmail.com" && self.textPassword.text == "12345"
//        {
//            let userDefault = UserDefaults.standard
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//            let  userVC = sb.instantiateViewController(withIdentifier: "BillVC") as! BillListTableTableViewController
//            //             userVC.eMailId = txtTextField.text
//            self.present(userVC, animated: true, completion: nil)
//            if switchRememberMe.isOn
//            {
//
//                userDefault.setValue(textEmailId.text, forKey: "userEmail")
//                userDefault.set(textPassword.text, forKey: "userPassword")
//            }
//            else
//            {
//                userDefault.removeObject(forKey: "userEmail")
//                userDefault.removeObject(forKey: "userPassword")
//            }
//        }
//        else
//        {
//            let alert = UIAlertController(title: "Error", message: "Try again, User Email / Password Invalid", preferredStyle: .alert)
//
//            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
//
//            alert.addAction(okButton)
//
//            self.present(alert, animated: true)
//        }
//

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*  @IBAction  func unWindLogoutFromAnyScreen(storyboardSegue: UIStoryboardSegue)
        {
           // print("Logout")
            let s = storyboardSegue.source as! BillListTableTableViewController
           // print(s.lblWelcome.text!)
            
            textPassword.text = ""
            textEmailId.text = ""
            
            
            
        }
 

 */
