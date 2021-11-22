//
//  RepeatedTask.swift
//  Deadlliner
//
//  Created by Arman on 19.11.2021.
//

import Foundation
import Firebase
import FirebaseDatabase

struct RepeatedTask {
    let title: String
    let category: String
    let deadline: String
    let userId: String
    let ref: DatabaseReference?
    
    init(title: String, category: String, deadline: String, userId: String) {
        self.title = title
        self.category = category
        self.deadline = deadline
        self.userId = userId
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        category = snapshotValue["category"] as! String
        deadline = snapshotValue["deadline"] as! String
        userId = snapshotValue["userId"] as! String
        ref = snapshot.ref
    }
    
    func convertToDictionary() -> Any {
        return ["title": title,
                "category": category,
                "deadline": deadline,
                "userId": userId
        ]
    }
}

