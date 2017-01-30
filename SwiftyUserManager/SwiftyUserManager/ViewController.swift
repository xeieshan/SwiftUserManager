//
//  ViewController.swift
//  SwiftyUserManager
//
//  Created by Zeeshan Haider on 30/01/2017.
//  Copyright © 2017 Zeeshan Haider. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        
        // To logout simply call
        // UserManager.logOutUserAndClearToken()
        
        // If you want to see if your user is logged (for autologin)
        
        /*
         if UserManager.currentUser != nil {
         // Take to App
         } else {
         // Take to Login
         }
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
}

