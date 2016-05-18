//
//  CategoryTable.swift
//  Testing
//
//  Created by Paul Benbrook on 5/16/16.
//  Copyright © 2016 Team IPC. All rights reserved.
//

import UIKit

class CategoryTable: UITableViewController {
    
    @IBOutlet weak var catTable: UITableView!
	
	var movieTable : MovieViewController = MovieViewController()
	
	var largestWidth : Float = 0
	var thisOne : CategoryCell = CategoryCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		largestWidth = 0
		
		catTable.tableFooterView = UIView()
		
		self.preferredContentSize.height = catTable.contentSize.height
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell  {
        let catCell = tableView.dequeueReusableCellWithIdentifier("categoryCell") as! CategoryCell
        
        catCell.thisCat = categories[indexPath.row]
		catCell.categoryLabel.text = categories[indexPath.row]
		
		if Float(catCell.categoryLabel.intrinsicContentSize().width) > largestWidth {
			largestWidth = Float(catCell.categoryLabel.intrinsicContentSize().width)
		}
		
		self.preferredContentSize.width = CGFloat(largestWidth + 20)
		
        return catCell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
	
	override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
		
		thisOne = catTable.cellForRowAtIndexPath(indexPath) as! CategoryCell
		
		//ChangeCategory(thisOne.thisCat)
		self.dismissViewControllerAnimated(true) { 
			self.movieTable.ChangeCategory(self.thisOne.thisCat)
		}
		
		return indexPath
	}
	
	/*
	override func viewDidDisappear(animated: Bool) {
		ChangeCategory(thisOne.thisCat)
	}
	*/
	
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
