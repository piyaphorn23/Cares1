//
//  FirstTableViewController.swift
//  Cares
//
//  Created by DE DPU on 5/10/2559 BE.
//  Copyright © 2559 MyApplication. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {

    var FirstTableArray = [String]()
    var SecondArray = [SecondTable]()
    var ThirdArray = [ThirdView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        FirstTableArray = ["ศีรษะ", "ลำตัวส่วนบน", "ลำตัวส่วนล่าง", "ทั่วไป"]
        
        SecondArray =
            [SecondTable(SecondTitle: ["สมองอักเสบ", "เนื้องอกในสมอง", "ปวดศีรษะจากความเครียด"]),
            SecondTable(SecondTitle: ["มะเร็งตับ", "ปอดอักเสบ", "กระเพาะอักเสบ"]),
                SecondTable(SecondTitle: ["ต่อมน้ำเหลืองอักเสบ", "กระเพาะปัสสาวะอักเสบ", "ข้อเสื่อม"]),
                SecondTable(SecondTitle: ["ไข้"])]
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        ThirdArray = [ThirdView(ThirdViewArray: ["สมองอักเสบ (Encephalitis)\r\n\r\nเป็นโรคที่พบได้ทั้งในเด็กและผู้ใหญ่ สาเหตุเกิดจากเชื้อไวรัส ซึ่งมีอยู่หลายชนิดที่พบบ่อยคือ B Virus ซึ่งปกติอาศัยอยู่ในสัตว์เลี้ยง เช่น หมู แพะ ม้า เป็นต้น ติดต่อถึงคนนโดยยุงรำคาญ(culex)\r\n\r\nอาการ\r\n\r\nมีใช้สูงอย่างเฉียบพลัน ปวดศีรษะ อ่อนเพลีย คลื่นไส้ อาเจียน ผู้ป่วยอาจจะซึมลงเรื่อยๆ จนไม่รู้สึกตัว อาจมีอาการชักร่วมด้วย\r\n\r\nสิ่งที่ตรวจพบ\r\n\r\nไข้สูง ซึม หรือหมดสติ deep tender refax ไวกว่าปกติ อาจมีมือสั่น หรืออาการอัมพาตของแขนและขา\r\n\r\nการรักษา\r\n\r\nหากสงสัย ให้รีบส่งแพทย์ ซึ่งอาจจะวินิจฉัยโรคโดยการเจาะหลัง(lumbar puncture) เพื่อตรวจน้ำไขสันหลัง และอาจจะต้องตรวจคลื่นสมองต่อไป","bbbb","cccc"]),//user \r\n in new line
            ThirdView(ThirdViewArray: ["dddd","eeee","ffff"]),
            ThirdView(ThirdViewArray: ["gggg","hhhh","iiii"]),
            ThirdView(ThirdViewArray: ["jjjj"])]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FirstTableArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var Cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        Cell.textLabel?.text = FirstTableArray[indexPath.row]
        
        return Cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
        var DestViewController = segue.destinationViewController as! SecondTableViewController
        var SecondTableArrayTwo : SecondTable
        var ThirdAnswerArray : ThirdView
        
        SecondTableArrayTwo = SecondArray[indexPath.row]
        DestViewController.SecondArray = SecondTableArrayTwo.SecondTitle
        
        ThirdAnswerArray = ThirdArray[indexPath.row]
        DestViewController.SecondAnswerArray = ThirdAnswerArray.ThirdViewArray
        
        
        
    }
    
    /*func colorForIndex(index: Int) -> UIColor {
        let itemCount = FirstTableArray.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
                            forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }*/
    
}
