//
//  AddItemTableViewController.swift
//  CheckList
//
//  Created by Peter Phanouvong on 19/1/19.
//  Copyright © 2019 Peter Phanouvong. All rights reserved.
//

import UIKit


protocol ItemDetailViewControllerDelegate: class {
    
    func ItemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    // any ViewController that wants to get a new CheckListItem needs to implement this protocol, by creating a delegate in the class
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: CheckListItem)
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: CheckListItem)
}

class ItemDetailViewController: UITableViewController {

    weak var delegate: ItemDetailViewControllerDelegate?
    // segue stuff: (1) create a properties in destination (self), this is what we will recieve from the previous view controller
    weak var todoList: TodoList?
    weak var itemToEdit: CheckListItem?
    
    
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func add(_ sender: Any) {
        
        if let item = itemToEdit, let text = textField.text {
            item.text = text
            delegate?.ItemDetailViewController(self, didFinishEditing: item)
        } else {
            if let item = todoList?.newTodo(){
                if let textFieldText = textField.text {
                    item.text = textFieldText
                }
                item.checked = false
                delegate?.ItemDetailViewController(self, didFinishAdding: item)
            }
        }
        

        
         
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.ItemDetailViewControllerDidCancel(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            addBarButton.isEnabled = true
        }
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

}

extension ItemDetailViewController: UITextFieldDelegate {
    //when u press done, remove the first response keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    //called when u type characters in the keyboard
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text,
              let stringRange = Range(range, in: oldText) else {
                return false
        }
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        return true
    }
}
