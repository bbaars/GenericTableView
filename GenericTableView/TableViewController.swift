//
//  ViewController.swift
//  GenericTableView
//
//  Created by Brandon Baars on 2/15/20.
//  Copyright © 2020 Brandon Baars. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dataSource: TableDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Recent"

        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseIdentifier)
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseIdentifier)
        tableView.register(FollowUserCell.self, forCellReuseIdentifier: FollowUserCell.reuseIdentifier)
        
        dataSource = TableDataSource(tableView: tableView, items: TableViewModel().data)
        
        dataSource.actionsProxy.on(.didSelect) { (configurator: UserCellConfigurator, cell) in
            print("Did Select User", configurator.item)
        }.on(.didSelect) { (configurator: PostCellConfigurator, cell) in
            print("Did Select Post")
        }.on(.didSelect) { (configurator: FollowUserCellConfigurator, cell) in
            print("Did Select Following User")
        }.on(.custom(FollowUserCell.userFollowAction)) { (configurator: FollowUserCellConfigurator, cell) in
            print("Did follow user", configurator.item.name)
        }
    }
}

