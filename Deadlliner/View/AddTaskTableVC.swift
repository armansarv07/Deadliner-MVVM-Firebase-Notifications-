//
//  AddTaskTableVC.swift
//  Deadlliner
//
//  Created by Arman on 14.11.2021.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class AddTaskTableVC: UITableViewController {
    // MARK: Variables
    var ref: DatabaseReference!
    var user: User!
    var currentTask: Task!
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var categoryLabel: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let currentUser = Auth.auth().currentUser else { return }
        saveButton.isEnabled = false
        titleLabel.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        user = User(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("tasks")
    }
    
    
    private func setupNavigationBar() {
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        navigationItem.leftBarButtonItem = nil
        title = currentTask.title
        saveButton.isEnabled = true
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let title = titleLabel.text, let category = categoryLabel.text, title != "", category != "" else {
            displayErrorAlertController(withTitle: "Not valid information is entered", message: "Please, check all rows for validity")
            return
        }
        
        let task = Task(title: title, category: category, userId: self.user.uid)
        let taskRef = self.ref.child(task.title.lowercased())
        taskRef.setValue(task.convertToDictionary())
        
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension AddTaskTableVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        
        if titleLabel.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}
