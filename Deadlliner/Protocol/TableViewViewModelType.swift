//
//  TableViewViewModelType.swift
//  Deadlliner
//
//  Created by Arman on 22.11.2021.
//

import Foundation

protocol TableViewViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
    
    func selectRow(atIndexPath indexPath: IndexPath)
}
