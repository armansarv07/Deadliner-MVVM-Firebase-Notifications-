//
//  ConfirmLogOut.swift
//  Deadlliner
//
//  Created by Arman on 14.11.2021.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

extension TasksVC {
    func presentAlertController(with title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) { action in
            do {
                try Auth.auth().signOut()
            } catch {
                print(error.localizedDescription)
            }
            self.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(yesAction)
        ac.addAction(cancelAction)
        present(ac, animated: true, completion: nil)
    }
}


