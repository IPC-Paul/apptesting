//
//  MovieTableViewCell.swift
//  Testing
//
//  Created by Paul Benbrook on 4/7/16.
//  Copyright © 2016 Team IPC. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet var poster: UIImageView!
    @IBOutlet var textarea: UILabel!
    
    @IBOutlet var showtimebuttons: [UIButton]!
    
    var category : String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
