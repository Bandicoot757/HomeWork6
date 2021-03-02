//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 12.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setContent()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setContent()
    }
    
    //MARK: - Views
    
    private lazy var authorLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        let image = UIImage()
        imageView.image = image
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Likes:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var likesCounterLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Views:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var viewsCounterLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    //MARK: - Layout Setting
    
    private func setContent() {
        contentView.addSubviews(authorLabel)
        contentView.addSubviews(postImageView)
        contentView.addSubviews(descriptionLabel)
        contentView.addSubviews(likesLabel)
        contentView.addSubviews(likesCounterLabel)
        contentView.addSubviews(viewsLabel)
        contentView.addSubviews(viewsCounterLabel)
        
        authorLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView)
            make.left.equalTo(contentView).offset(16)
            make.right.equalTo(contentView).offset(-16)
        }
        
        postImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(authorLabel.snp.bottom)
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.height.equalTo(contentView.snp.width)
            make.width.equalTo(contentView)
        }
        
       descriptionLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(postImageView.snp.bottom).offset(16)
            make.bottom.equalTo(likesCounterLabel.snp.top).offset(-16)
            make.left.equalTo(contentView).offset(16)
            make.right.equalTo(contentView).offset(-16)
        }
        
        likesLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.left.equalTo(contentView).offset(16)
            make.right.equalTo(likesCounterLabel.snp.left).offset(-8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
         }
        
        likesCounterLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
            make.left.equalTo(likesLabel.snp.right).offset(8)
         }
        
        viewsLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
            make.right.equalTo(viewsCounterLabel.snp.left).offset(-16)
         }
        
        viewsCounterLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
            make.left.equalTo(viewsLabel.snp.right).offset(16)
            make.right.equalTo(contentView).offset(-16)
         }
    }
    
     func configure(post: Post) {
        authorLabel.text = post.author
        postImageView.image = post.image
        descriptionLabel.text = post.description
        likesCounterLabel.text = String(post.likes)
        viewsCounterLabel.text = String(post.views)
        
    }

}
