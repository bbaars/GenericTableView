//
//  UserTableViewCell.swift
//  GenericTableView
//
//  Created by Brandon Baars on 2/15/20.
//  Copyright © 2020 Brandon Baars. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell, ConfigurableCell {
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 17)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.layer.masksToBounds = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        addSubview(userImageView)
        
        userImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        userImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        userImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 16).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        nameLabel.text = ""
        userImageView.image = nil
    }
    
    func configure(with item: User) {
        nameLabel.text = item.name
        userImageView.image = UIImage(named: item.image) ?? UIImage()
    }
}
