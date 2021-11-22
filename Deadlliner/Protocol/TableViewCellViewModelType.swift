//
//  TableViewCellViewModelType.swift
//  Deadlliner
//
//  Created by Arman on 19.11.2021.
//

import Foundation

protocol TableViewCellViewModelType: AnyObject {
    var title: String { get }
    var category: String { get }
}
