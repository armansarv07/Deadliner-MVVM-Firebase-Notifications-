//
//  RegistrationTableVC.swift
//  Deadlliner
//
//  Created by Arman on 13.11.2021.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RegistrationTableVC: UITableViewController {
    // MARK: Variables of Firebase
    var ref: DatabaseReference!
    
    // MARK: IBOutlets
    
    @IBOutlet weak var emailTextfileld: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repeatPasswordTextfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference(withPath: "users")
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 || indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.width)
        }
    }
    
    // MARK: IBActions
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        guard let email = emailTextfileld.text, let password = passwordTextfield.text, let repeatPassword = repeatPasswordTextfield.text, email != "", password != "", repeatPassword != "" else {
            displayErrorAlertController(withTitle: "Error with data", message: "Your input data is incorrect, please check your data")
            return
        }
        guard password == repeatPassword else {
            displayErrorAlertController(withTitle: "Password error", message: "Passwords do not match")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] (user, error) in
            guard error == nil, user != nil else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            let userRef = self?.ref.child((user?.user.uid)!)
            userRef?.setValue(["email": user?.user.email])
        }
    
        dismiss(animated: true)
    }
    
    // MARK: Move keyboard
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    

}
