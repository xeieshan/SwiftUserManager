//
//  ViewController.swift
//  SwiftyUserManager
//
//  Created by Zeeshan Haider on 30/01/2017.
//  Copyright © 2017 Zeeshan Haider. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnUserStatus: UIButton!
    @IBOutlet weak var lblUserStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        // To logout simply call
        // UserManager.logOutUserAndClearToken()
        
        // If you want to see if your user is logged (for autologin)
        
        self.updateStatus()
        
        /*if UserManager.currentUser != nil {
         // Take to Apptw
     
         
         } else {
         // Take to Login
         }*/
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    func updateStatus() {
        btnUserStatus.isSelected = UserManager.currentUser != nil
        lblUserStatus.text = UserManager.currentUser != nil ? "Current Status: Logged in as "+(UserManager.currentUser?.firstName)! : "Current Status: Logged Out"
    }
    @IBAction func btnLogout_Pressed(_ sender: UIButton) {
        if sender.isSelected {
            
            UserManager.logOutCurrentUser()
        } else {
            // Call api and give the json to MOProfile to make a model
            // and call UserManager.setCurrentUser(model)
            
            let profileFromServer = [
                "firstName" : "Zeeshan",
                "userName" : "xeieshan",
                "lastName" : "Haider",
                "id" : 1,
                "email" : "xeieshan@gmail.com"
                ] as [String : Any]
            let profileModel : MOProfile = MOProfile(profileFromServer as Dictionary<String, AnyObject>)
            UserManager.setCurrentUser(newCurrentUser: profileModel)
            
            // Now you can use this
            debugPrint((UserManager.currentUser?.firstName)! as String)
        }
        self.updateStatus()
    }
}

