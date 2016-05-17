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
    @IBOutlet weak var catButt: UIButton!
    
    @IBAction func catButtTouched(sender: AnyObject) {
        currentCategory = thisCat
    }

}

// var modalPresentationStyle: UIModalPresentationStyle