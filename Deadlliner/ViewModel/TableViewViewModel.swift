//
//  TableViewViewModel.swift
//  Deadlliner
//
//  Created by Arman on 14.11.2021.
//

import Foundation
import Firebase
import FirebaseDatabase

class TableViewViewModel: TableViewViewModelType {
    
    var ref: DatabaseReference!
    var user: User!
    var tasks: [Task] = []
    var selectedIndexPath: IndexPath?
    
    func setupFirebaseDatabase() {
        guard let currentUser = Auth.auth().currentUser else { return }
        user = User(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("tasks")
    }
    
    
    func numberOfRows() -> Int {
        return tasks.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let task = tasks[indexPath.row]
        return TableViewCellViewModel(task: task)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func deleteRow(forIndexPath indexPath: IndexPath) {
        
    }
    
    init() {
        setupFirebaseDatabase()
        ref.observe(.value) {[weak self] (snapshot) in
            var _tasks = Array<Task>()
            for item in snapshot.children {
                let task = Task(snapshot: item as! DataSnapshot)
                _tasks.append(task)
            }
            self?.tasks = _tasks
        }
    }
}
