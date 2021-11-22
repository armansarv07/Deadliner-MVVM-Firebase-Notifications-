//
//  TasksTableViewCell.swift
//  Deadlliner
//
//  Created by Arman on 14.11.2021.
//

import Foundation
import UIKit

class TasksTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            titleLable.text = viewModel.title
            categoryLabel.text = viewModel.category
        }
    }
}
