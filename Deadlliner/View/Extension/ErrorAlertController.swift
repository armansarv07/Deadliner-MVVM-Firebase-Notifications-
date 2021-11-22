//
//  AlertController.swift
//  Deadlliner
//
//  Created by Arman on 14.11.2021.
//

import Foundation
import UIKit

extension LoginVC {
    func displayErrorAlertController(withTitle title: String, message: String) {
        let style: UIAlertController.Style = .alert
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        ac.addAction(okAction)
        present(ac, animated: true, completion: nil)
    }
}

extension RegistrationTableVC {
    func displayErrorAlertController(withTitle title: String, message: String) {
        let style: UIAlertController.Style = .alert
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        ac.addAction(okAction)
        present(ac, animated: true, completion: nil)
    }
}


extension AddTaskTableVC {
    func displayErrorAlertController(withTitle title: String, message: String) {
        let style: UIAlertController.Style = .alert
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        ac.addAction(okAction)
        present(ac, animated: true, completion: nil)
    }
}
