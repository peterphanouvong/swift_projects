//
//  TodoList.swift
//  CheckList
//
//  Created by Peter Phanouvong on 18/1/19.
//  Copyright © 2019 Peter Phanouvong. All rights reserved.
//

import Foundation

class TodoList {
    var todos: [CheckListItem] = []
    
    init() {
        let row0Item = CheckListItem()
        let row1Item = CheckListItem()
        let row2Item = CheckListItem()
        let row3Item = CheckListItem()
        let row4Item = CheckListItem()
        
        row0Item.text = "Take a jog"
        row1Item.text = "Watch a movie"
        row2Item.text = "Code an app"
        row3Item.text = "Walk the dog"
        row4Item.text = "Study design patters"
        
        todos.append(row0Item)
        todos.append(row1Item)
        todos.append(row2Item)
        todos.append(row3Item)
        todos.append(row4Item)
        
    }
    
    func newTodo() -> CheckListItem {
        let item = CheckListItem()
        item.checked = false
        todos.append(item)
        
        return item
    }
    
    func move(item: CheckListItem, index: Int){
        guard let currentIndex = todos.firstIndex(of: item) else{
            return
        }
        todos.remove(at: currentIndex)
        todos.insert(item, at: index)
    }
    
    func remove(items: [CheckListItem]) {
        for item in items {
            if let index = todos.firstIndex(of: item) {
                todos.remove(at: index)
            }
        }
    }
    
}
