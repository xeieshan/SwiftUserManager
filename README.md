# SwiftUserManager
A usermanager written in swift 3.0 saves you from hassle of saving your active user session.


	** Call api and give the json to MOProfile to make a model and call UserManager.setCurrentUser(model)
        
        let profileFromServer = [
            "firstName" : "Zeeshan",
            "userName" : "xeieshan",
            "lastName" : "Haider",
            "id" : 1,
            "email" : "xeieshan@gmail.com"
            ] as [String : Any]
        let profileModel : MOProfile = MOProfile(profileFromServer as Dictionary<String, AnyObject>)
        UserManager.setCurrentUser(newCurrentUser: profileModel)
        
        **Now you can use this**
        debugPrint((UserManager.currentUser?.firstName)! as String)
        
        **To logout simply call**
        UserManager.logOutUserAndClearToken()
        
        **If you want to see if your user is logged (for autologin)**
         if UserManager.currentUser != nil {
         // Take to App
         } else {
         // Take to Login
         }
