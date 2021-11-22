//
//  ViewController.swift
//  Deadlliner
//
//  Created by Arman on 13.11.2021.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginVC: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        Auth.auth().addStateDidChangeListener({ [weak self] (auth, user) in
            if user != nil {
                self?.performSegue(withIdentifier: "loggedInUser", sender: nil)
            }
        })
    }
    
    // MARK: IBActions
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextfield.text, let password = passwordTextfield.text, email != "", password != "" else {
            displayErrorAlertController(withTitle: "Error with data", message: "Your input data is incorrect, please check your data")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                self.displayErrorAlertController(withTitle: "Error occured", message: "Occured error with login")
            }
            if user != nil {
                self.performSegue(withIdentifier: "loggedInUser", sender: nil)
            }
            self.displayErrorAlertController(withTitle: "There is no such user in database", message: "Create a new one")
        }
    }
    
    @IBAction func registrationTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "registrationSegue", sender: nil)
    }
    

    
    
    // MARK: Move keyboard
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
}

