//
//  ShareViewController.swift
//  FBPost_Swift23
//
//  Created by Luthfi Fathur Rahman on 10/22/16.
//  Copyright © 2016 Imperio Teknologi Indonesia. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKShareKit

class ShareViewController: UIViewController, FBSDKLoginButtonDelegate, FBSDKSharingDelegate {

    var emailUser: String!
    let loginManager: FBSDKLoginManager = FBSDKLoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: self.view.frame.size.width/3, y: self.view.frame.size.height/4, width: 200, height: 21))
        //label.center = self.view.center//CGPoint(x: 140, y: 284) //132
        label.textAlignment = NSTextAlignment.center
        label.text = emailUser! //"I'am a test label"
        label.sizeToFit()
        view.addSubview(label)

        let content = FBSDKShareLinkContent()
        content.contentURL = URL(string: "https://developers.facebook.com/docs/sharing/ios/") as URL!
        content.contentTitle = "Share Link Test"
        content.contentDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lacinia, metus ut consectetur imperdiet, lorem tellus consectetur elit, quis tempus lacus nibh sit amet erat. Curabitur rhoncus justo turpis, non ultricies dolor scelerisque vitae. Praesent imperdiet, urna quis commodo convallis, augue nulla luctus enim, porta consectetur ex augue sit amet ligula. Nam sollicitudin nisi at tempus porta. In ex ipsum, pellentesque sed ullamcorper sit amet, ultrices quis eros. Ut ultrices enim nulla, quis dapibus tellus lacinia et. Vestibulum vel vulputate leo, a ultricies purus. Proin ac ornare neque."
        content.imageURL = URL(string: "http://kartuweb.org/cmsbaru/picture/4749500give.jpg") as URL!
        
        let btnFBShare = FBSDKShareButton()
        //btnFBShare.frame = CGRect(x:(UIScreen.main.bounds.width - 100) * 0.5, y:50, width:100, height:25)
        btnFBShare.center = self.view.center
        btnFBShare.shareContent = content
        view.addSubview(btnFBShare)
        if (btnFBShare.isHidden) {
            print("it's hidden")
        } else {
            view.addSubview(btnFBShare)
        }
        
        /*let btn_logOut = UIButton()
        btn_logOut.setTitle("Log Out", forState: .Normal)
        btn_logOut.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn_logOut.backgroundColor = UIColor.blueColor()
        btn_logOut.frame = CGRectMake(132, 400, 111, 30)
        btn_logOut.addTarget(self, action: #selector(ShareViewController.loginButtonDidLogOut(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(btn_logOut)*/
        let loginButton = FBSDKLoginButton.init()
        loginButton.frame = CGRect(x: self.view.frame.size.width/3, y: self.view.frame.size.height/1.5, width: 100, height: 30)
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //FBSDKLoginButtonDelegate
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!){
        
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
        performSegue(withIdentifier: "loggingOut", sender: loginButton)
    }
    
    //FBSDKSharingDelegate
    func sharer(_ sharer: FBSDKSharing!, didCompleteWithResults results: [AnyHashable: Any]) {
        print(results)
    }
    func sharer(_ sharer: FBSDKSharing!, didFailWithError error: Error!) {
        print("sharer NSError")
        print(error)
    }
    func sharerDidCancel(_ sharer: FBSDKSharing!) {
        print("sharerDidCancel")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
