//
//  TableViewModel.swift
//  GenericTableView
//
//  Created by Brandon Baars on 2/15/20.
//  Copyright © 2020 Brandon Baars. All rights reserved.
//

import Foundation

typealias UserCellConfigurator = TableCellConfigurator<UserCell, User>
typealias PostCellConfigurator = TableCellConfigurator<PostCell, Post>
typealias FollowUserCellConfigurator = TableCellConfigurator<FollowUserCell, User>

class TableViewModel {

    var data: [CellConfigurator] = [
        UserCellConfigurator(User(name: "Molly Jefferson", image: "profile1")),
        PostCellConfigurator(Post(user: User(name: "Brandon Baars", image: "profile2"),
                                  image: "landscape1",
                                  description: "Back when I was in idaho for vacation, we used to travel down this road a lot")),
        UserCellConfigurator(User(name: "James Turner", image: "profile3")),
        UserCellConfigurator(User(name: "Hailey Ring", image: "profile4")),
        FollowUserCellConfigurator(User(name: "Jason Smith", image: "profile5"))
    ]
}
