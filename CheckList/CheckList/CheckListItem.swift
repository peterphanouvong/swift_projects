//
//  CheckListItem.swift
//  CheckList
//
//  Created by Peter Phanouvong on 17/1/19.
//  Copyright © 2019 Peter Phanouvong. All rights reserved.
//

import Foundation

class CheckListItem: NSObject{ //nsobject allows us to compare object against object
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
