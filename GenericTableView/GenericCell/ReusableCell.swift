//
//  ReusableCell.swift
//  GenericTableView
//
//  Created by Brandon Baars on 2/15/20.
//  Copyright © 2020 Brandon Baars. All rights reserved.
//

import Foundation

protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
