//
//  LastPageViewController.swift
//  Cares
//
//  Created by DE DPU on 5/16/2559 BE.
//  Copyright © 2559 MyApplication. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class LastPageViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myDP: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel.text = getNowTime()
        _ = NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: "update", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private var tempTime: String = "00:00"
    private var setTime: String = "00:00"
    
    @IBAction func myDPFunc(sender: AnyObject) {
        print("test: myDP moved!")
        
        let format = NSDateFormatter()
        format.dateFormat = "HH:mm"
        tempTime = format.stringFromDate(myDP.date)
        
    }
    
    @IBAction func myButtonFunc(sender: AnyObject) {
        setTime = tempTime
        
        print("test: myButton Pushed!")
        
    }
    
    func getNowTime()-> String {
        let nowTime: NSDate = NSDate()
        let format = NSDateFormatter()
        format.dateFormat = "HH:mm"
        let nowTimeStr = format.stringFromDate(nowTime)
        return nowTimeStr
    }
    
    func update(){
        let str = getNowTime()
        myLabel.text = str
        myAlarm(str)
    }
    
    func myAlarm(str: String){
        if str == setTime{
            alert()
        }
    }
    
    func alert(){
        let myAlert = UIAlertController(title: "alert", message: "A DRUG", preferredStyle: .Alert)
        let myAction = UIAlertAction(title: "Done", style: .Default){
            action in print("foo!!")
        }
        myAlert.addAction(myAction)
        presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    
    

}
