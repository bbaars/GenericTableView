//
//  TableCellConfigurator.swift
//  GenericTableView
//
//  Created by Brandon Baars on 2/15/20.
//  Copyright © 2020 Brandon Baars. All rights reserved.
//

import UIKit

protocol CellConfigurator {
    static var reuseIdentifier: String { get }
    func configure(cell: UITableViewCell)
}

class TableCellConfigurator<Cell: ConfigurableCell, T>: CellConfigurator
    where Cell.T == T, Cell: UITableViewCell {

    static var reuseIdentifier: String {
        String(describing: Cell.reuseIdentifier)
    }
    
    private(set) var item: T
    
    init(_ item: T) {
        self.item = item
    }
    
    func configure(cell: UITableViewCell) {
        (cell as! Cell).configure(with: item)
    }
}
