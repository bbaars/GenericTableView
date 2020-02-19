//
//  PostCell.swift
//  GenericTableView
//
//  Created by Brandon Baars on 2/16/20.
//  Copyright © 2020 Brandon Baars. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell, ConfigurableCell {
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 17)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.layer.masksToBounds = true
        
        postImage.layer.cornerRadius = 8
        postImage.layer.masksToBounds = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(userImageView)
        addSubview(nameLabel)
        addSubview(postImage)
        addSubview(descriptionLabel)
        
        userImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        userImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 16).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor).isActive = true
        
        postImage.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 8).isActive = true
        postImage.leftAnchor.constraint(equalTo: userImageView.rightAnchor).isActive = true
        postImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: postImage.leftAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: postImage.rightAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: Post) {
        userImageView.image = UIImage(named: item.user.image)
        nameLabel.text = item.user.name
        postImage.image = UIImage(named: item.image)
        descriptionLabel.text = item.description
    }
}
