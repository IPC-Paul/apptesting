//
//  CategoryCell.swift
//  Testing
//
//  Created by Paul Benbrook on 5/16/16.
//  Copyright © 2016 Team IPC. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell  {
    
    var thisCat : String = ""
    @IBOutlet var categoryButton: UIButton!
    
    
    @IBAction func CategoryButtonPress(sender: AnyObject) {
        currentCategory = thisCat
    }

}

// var modalPresentationStyle: UIModalPresentationStyle