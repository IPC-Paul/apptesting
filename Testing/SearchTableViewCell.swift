//
//  SearchTableViewCell.swift
//  Testing
//
//  Created by Paul Benbrook on 4/19/16.
//  Copyright © 2016 Team IPC. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var searchResultLabel: UILabel!
    @IBOutlet var searchResultBlurb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
