//
//  ViewController.swift
//  FBPost_Swift23
//
//  Created by Luthfi Fathur Rahman on 10/22/16.
//  Copyright © 2016 Imperio Teknologi Indonesia. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var emailuser = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Buat ngecek versi swift yang dipake di proyek xcode ini
        #if swift(>=3.0)
            print("Hello, Swift 3!")
        #elseif swift(>=2.3)
            print("Hello, Swift 2.3!")
        #elseif swift(>=2.1)
            print("Hello, Swift 2.1!")
        #endif
        
        if (FBSDKAccessToken.currentAccessToken()) != nil {
            let FBToken = FBSDKAccessToken.currentAccessToken().tokenString
            print("FB Token di viewdidload: \(FBToken)")
            let loginButton = FBSDKLoginButton.init()
            loginButton.center = self.view.center
            loginButton.delegate = self
            self.view.addSubview(loginButton)
            fetchProfile()
            //performSegueWithIdentifier("loggingIn", sender: self)
        } else {
            let loginButton = FBSDKLoginButton.init()
            
            loginButton.center = self.view.center
            self.view.addSubview(loginButton)
            loginButton.readPermissions = ["email"]
            loginButton.loginBehavior = FBSDKLoginBehavior.Web
            loginButton.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchProfile() {
        if(FBSDKAccessToken.currentAccessToken() != nil){
            print("FB Token di fungsi fetchprofile: \(FBSDKAccessToken.currentAccessToken().tokenString)")
            let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email"])
            graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
                
                if ((error) != nil)
                {
                    print("Error FBSDKGraphRequest: \(error)")
                }
                else
                {
                    print("fetched user: \(result)")
                    let userEmail : NSString = result.valueForKey("email") as! NSString
                    print("User Email is: \(userEmail)")
                    self.emailuser = userEmail as String
                    print("Nilai var emailuser di dalem handler = \(self.emailuser)")
                    self.performSegueWithIdentifier("loggingIn", sender: self)
                }
            })
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestVc = segue.destinationViewController as! ShareViewController
        if segue.identifier == "loggingIn" {
            print("Email yang di passing (prepare segue): \(emailuser)")
            DestVc.emailUser = self.emailuser
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        if(FBSDKAccessToken.currentAccessToken() != nil){
            print("FB Token fungsi loginButtonComplete: \(FBSDKAccessToken.currentAccessToken().tokenString)")
            self.fetchProfile()
            //print("Email yang di passing (login button): \(emailuser)")
            //performSegueWithIdentifier("loggingIn", sender: loginButton)
        } else {
            if ((error) != nil){
                // Process error
                print("Error login: \(error)")
                loginManager.logOut()
            } else if result.isCancelled {
                // Handle cancellations
                print("User cancel the login")
                loginManager.logOut()
            } else if result.grantedPermissions.contains("email") {
                // If you ask for multiple permissions at once, you
                // should check if specific permissions missing
                print("User Logged In")
                self.fetchProfile()
                //performSegueWithIdentifier("loggingIn", sender: loginButton)
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
        
        print("User Logged Out")
    }


}

