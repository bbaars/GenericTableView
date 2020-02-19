//
//  FollowUserCell.swift
//  GenericTableView
//
//  Created by Brandon Baars on 2/16/20.
//  Copyright © 2020 Brandon Baars. All rights reserved.
//

import UIKit

class FollowUserCell: UserCell {
    
    static let userFollowAction = "UserFollowAction"
    
    private lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 12)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        button.addTarget(self, action: #selector(onFollowTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        followButton.layer.cornerRadius = followButton.bounds.size.height / 2
        followButton.layer.masksToBounds = true
        
        followButton.layer.borderColor = UIColor.blue.cgColor
        followButton.layer.borderWidth = 1.0
    }
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(followButton)
    
        NSLayoutConstraint(item: followButton,
                           attribute: .width,
                           relatedBy: .greaterThanOrEqual,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 50).isActive = true
        followButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        followButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func onFollowTapped(_ sender: Any) {
        CellAction.custom(type(of: self).userFollowAction).invoke(cell: self)
    }
}
