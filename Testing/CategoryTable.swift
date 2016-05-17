//
//  CategoryTable.swift
//  Testing
//
//  Created by Paul Benbrook on 5/16/16.
//  Copyright © 2016 Team IPC. All rights reserved.
//

import UIKit

class CategoryTable: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell  {
        let catCell = tableView.dequeueReusableCellWithIdentifier("categoryCell")
        return catCell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
