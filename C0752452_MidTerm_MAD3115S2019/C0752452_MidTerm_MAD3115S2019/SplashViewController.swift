//
//  SplashViewController.swift
//  C0752452_MidTerm_MAD3115S2019
//
//  Created by Hargun Marya on 2019-07-11.
//  Copyright © 2019 Hargun Marya. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(self.gotoLoginscreen), with: nil, afterDelay: 1)
        // Do any additional setup after loading the view.
    }
    @objc func gotoLoginscreen()  {
        performSegue(withIdentifier: "LoginVC", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
