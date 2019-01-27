//
//  ChecklistTableViewCell.swift
//  CheckList
//
//  Created by Peter Phanouvong on 26/1/19.
//  Copyright © 2019 Peter Phanouvong. All rights reserved.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {

    @IBOutlet weak var checkmarkLabel: UILabel!
    
    @IBOutlet weak var todoTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
