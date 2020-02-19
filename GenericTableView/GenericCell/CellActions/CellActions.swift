//
//  CellActions.swift
//  GenericTableView
//
//  Created by Brandon Baars on 2/17/20.
//  Copyright © 2020 Brandon Baars. All rights reserved.
//

import UIKit

enum CellAction: Hashable {
    case didSelect
    case willDisplay
    case custom(String)
}

struct CellActionEventData {
    let action: CellAction
    let cell: UIView
}

extension CellAction {
    static let notificationName = Notification.Name(rawValue: "CellAction")
    
    public func invoke(cell: UIView) {
        NotificationCenter.default.post(name: Self.notificationName,
                                        object: nil,
                                        userInfo: ["data": CellActionEventData(action: self,
                                                                               cell: cell)])
    }
}
