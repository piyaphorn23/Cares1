//
//  LoginViewController.swift
//  Cares
//
//  Created by DE DPU on 5/12/2559 BE.
//  Copyright © 2559 MyApplication. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import SwiftyJSON

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate, KumulosDelegate
{
    
    var username: String!
    var userid:String!
    var userid0:String!
    //1ส่วนดึงข้อมุลจาก Kumulos
    var kumuAPI = Kumulos()
    
    var username_all = [String]()
    var password_all = [String]()
    var userid_all = [String]()

    @IBOutlet weak var lblUsername: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet weak var btnFacebook: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        kumuAPI = Kumulos()
        kumuAPI.delegate = self
        kumuAPI.selectUserWithUsername("")
        
        if (FBSDKAccessToken.currentAccessToken() == nil)
        {
            print("Not logged in...")
        }
        else
        {
            print("Logged in...")
        }
        
        var loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        
        loginButton.delegate = self
        
        self.view.addSubview(loginButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        kumuAPI.selectUserWithUsername("")
    }
    
    /*func configureFacebook()
    {
        btnFacebook.readPermissions = ["public_profile", "email", "user_friends"];
        btnFacebook.delegate = self
    }*/
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        
        if error == nil{
            print("Login complete.")
            self.performSegueWithIdentifier("showNew", sender: self)
        }
        else{
            print(error.localizedDescription)
        }
        
        //FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, picture.type(large)"]).startWithCompletionHandler { (connection, result, error) -> Void in
            
            /*let strFirstName: String = (result.objectForKey("first_name") as? String)!
            let strLastName: String = (result.objectForKey("last_name") as? String)!
            let strPictureURL: String = (result.objectForKey("picture")?.objectForKey("data")?.objectForKey("url") as? String)!*/
            
            /*self.lblName.text = "Welcome, \(strFirstName) \(strLastName)"
            self.ivUserProfileImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: strPictureURL)!)!)*/
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
        
        /*ivUserProfileImage.image = nil
        lblName.text = ""*/
    }
    
    @IBAction func buttonSignIn_onclick() {
        var count_username = 0
        var count_password = 0
        var number: Int = 0
        
        if(lblUsername.text != nil)
        {
            for item in username_all
            {
                if (item == lblUsername.text)
                {
                    count_username = 1
                    
                    for items in password_all
                    {
                        //print(number)
                        
                        if(items.isEqual(lblPassword.text))
                        {
                            userid0 = userid_all[number]
                            //print(userid0)
                            
                            NSLog("SignIn Success");
                            //let vc = self.storyboard?.instantiateViewControllerWithIdentifier("HomeViewController") as!HomeViewController //ระบุหน้าที่จะไป
                            //vc.value = txtUsername_login.text //ส่งค่า username ไป หน้า HomeViewController สำหรับค่าเดียว
                            // self.presentViewController(vc, animated: true, completion: nil)
                            
                            username = lblUsername.text
                            
                            userid = userid0
                            performSegueWithIdentifier("showNew", sender: nil) //หลายค่าใช้ seque
                            
                            
                            
                            count_password = 1
                        }
                        else
                        {
                            count_password = 2
                        }
                        number += 1
                    }
                }
                count_username = 2
            }
        }
        if(lblUsername.text == "" || lblPassword.text == "")
        {
            if(lblUsername.text == "")
            {
                let alertController = UIAlertController(title: "Not found", message: "Please Enter a Username", preferredStyle: UIAlertControllerStyle.Alert);
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            if(lblPassword.text == "")
            {
                let alertController = UIAlertController(title: "Not found", message: "Please Enter a Password", preferredStyle: UIAlertControllerStyle.Alert);
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            
        }
        if(count_username == 1 || count_password == 2)
        {
            let alertController = UIAlertController(title: "Invalid", message: "Incorrect a Username or Password", preferredStyle: UIAlertControllerStyle.Alert);
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        if(count_username == 0 || count_password == 0)
        {
            let alertController = UIAlertController(title: "Invalid", message: "Incorrect a Username or Password", preferredStyle: UIAlertControllerStyle.Alert);
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showNew") {
            var svc = segue.destinationViewController as! MapkitViewController;
            
            svc.username1 = username
            svc.userid1 = userid
        }
    }*/
    
    func  kumulosAPI(kumulos: Kumulos!, apiOperation operation: KSAPIOperation!, selectUserDidCompleteWithResult theResults: [AnyObject]!) {
        
        let json = JSON(theResults)
        
        for (var i = 0; i<json.count;i=i+1)
        {
            var usernames = json[i]["username"].stringValue
            var passwords = json[i]["password"].stringValue
            var userids = json[i]["userID"].stringValue
            // วนในเจสันหมด แล้วเอามาเก็บไว้ในตัวแปร
            username_all.append(usernames)
            password_all.append(passwords)
            userid_all.append(userids)
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}



