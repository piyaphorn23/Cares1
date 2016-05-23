//
//  SecondTableView.swift
//  Cares
//
//  Created by DE DPU on 5/10/2559 BE.
//  Copyright © 2559 MyApplication. All rights reserved.
//

import Foundation
import UIKit

class SecondTableViewController: UITableViewController {
    
    var SecondArray = [String]()
    var SecondAnswerArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()   
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SecondArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var Cell = self.tableView.dequeueReusableCellWithIdentifier("SecondCell", forIndexPath: indexPath) as UITableViewCell
        
        Cell.textLabel?.text = SecondArray[indexPath.row]
        
        return Cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
        
        var DestViewController = segue.destinationViewController as! ListViewController
        
        DestViewController.FirstString = SecondAnswerArray[indexPath.row]
        
    }
    
    /*func colorForIndex(index: Int) -> UIColor {
        let itemCount = SecondArray.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
                            forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }*/
    
}
