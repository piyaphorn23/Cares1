//
//  ListViewController.swift
//  Cares
//
//  Created by DE DPU on 5/11/2559 BE.
//  Copyright © 2559 MyApplication. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
   
    @IBOutlet weak var TextView: UITextView!
    
    var FirstString = String()
    
    override func viewDidLoad() {
        
        TextView.text = FirstString
        
    }
}