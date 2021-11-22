//
//  TableViewCellViewModel.swift
//  Deadlliner
//
//  Created by Arman on 14.11.2021.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    private var task: Task
    
    var title: String {
        return "Task title: \(task.title)"
    }
    
    var category: String {
        return "Task type: \(task.category)"
    }
    
    init(task: Task) {
        self.task = task
    }
    
}
