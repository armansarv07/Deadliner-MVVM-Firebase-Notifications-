//
//  Task.swift
//  Deadlliner
//
//  Created by Arman on 14.11.2021.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Task {
    let title: String
    let category: String
    var completed: Bool = false
    let userId: String
    let ref: DatabaseReference?
    
    init(title: String, category: String ,userId: String) {
        self.title = title
        self.category = category
        self.userId = userId
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        category = snapshotValue["category"] as! String
        completed = snapshotValue["completed"] as! Bool
        userId = snapshotValue["userId"] as! String
        ref = snapshot.ref
    }
    
    func convertToDictionary() -> Any {
        return ["title": title,
                "category": category,
                "completed": completed,
                "userId": userId ]
    }
}
