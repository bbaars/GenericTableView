//
//  ConfigurableCell.swift
//  GenericTableView
//
//  Created by Brandon Baars on 2/15/20.
//  Copyright © 2020 Brandon Baars. All rights reserved.
//

import Foundation

protocol ConfigurableCell: ReusableCell {
    associatedtype T
       
    func configure(with item: T)
}
