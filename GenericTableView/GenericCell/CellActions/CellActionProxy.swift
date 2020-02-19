//
//  CellActionProxy.swift
//  GenericTableView
//
//  Created by Brandon Baars on 2/17/20.
//  Copyright © 2020 Brandon Baars. All rights reserved.
//

import UIKit

class CellActionProxy {
    
    private var actions = [String: ((CellConfigurator, UIView) -> Void)]()
    
    func invoke(action: CellAction, cell: UIView, configurator: CellConfigurator) {
        let key = "\(action.hashValue)\(type(of: configurator).reuseIdentifier)"
        if let action = actions[key] {
            action(configurator, cell)
        }
    }
    
    @discardableResult
    func on<CellType, DataType>(_ action: CellAction, handler: @escaping ((TableCellConfigurator<CellType, DataType>, CellType) -> Void)) -> Self {
        let key = "\(action.hashValue)\(CellType.reuseIdentifier)"
        self.actions[key] = { (c, cell) in
            handler(c as! TableCellConfigurator<CellType, DataType>, cell as! CellType)
        }
        
        return self
    }
}
