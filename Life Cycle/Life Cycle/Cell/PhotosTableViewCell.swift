//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 16.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setContent()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setContent()
    }
    
    //MARK: - Views
    
    private lazy var photosLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "arrow.png")
        imageView.image = image
        return imageView
    }()
    
    private lazy var photosImageViewOne: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "Airplane")
        imageView.image = image
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var photosImageViewTwo: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "Moon")
        imageView.image = image
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var photosImageViewThree: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "Animal")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var photosImageViewFour: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "river")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    //MARK: - Layout Setting
    
    private func setContent() {
        
        setSubviews()
        
        photosLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView).offset(12)
            make.bottom.equalTo(photosImageViewOne.snp.top).offset(-12)
            make.left.equalTo(contentView).offset(12)
            make.right.equalTo(arrowImageView).offset(-12)
         }
        
        
        arrowImageView.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(photosLabel)
            make.right.equalTo(contentView).offset(-12)
         }
        
        photosImageViewOne.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(contentView).offset(12)
            make.top.equalTo(photosLabel.snp.bottom).offset(12)
            make.bottom.equalTo(contentView).offset(-12)
            make.right.equalTo(photosImageViewTwo.snp.left).offset(-8)
            make.width.equalTo(photosImageViewTwo)
            make.height.equalTo(75)
         }
        
        photosImageViewTwo.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(photosImageViewOne.snp.right).offset(8)
            make.top.equalTo(photosLabel.snp.bottom).offset(12)
            make.bottom.equalTo(contentView).offset(-12)
            make.right.equalTo(photosImageViewThree.snp.left).offset(-8)
            make.width.equalTo(photosImageViewThree)
            make.height.equalTo(75)
         }
        
        photosImageViewThree.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(photosImageViewTwo.snp.right).offset(8)
            make.top.equalTo(photosLabel.snp.bottom).offset(12)
            make.bottom.equalTo(contentView).offset(-12)
            make.right.equalTo(photosImageViewFour.snp.left).offset(-8)
            make.width.equalTo(photosImageViewFour)
            make.height.equalTo(75)
         }
        
        photosImageViewFour.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(photosImageViewThree.snp.right).offset(8)
            make.top.equalTo(photosLabel.snp.bottom).offset(12)
            make.bottom.equalTo(contentView).offset(-12)
            make.right.equalTo(contentView).offset(-8)
            make.width.equalTo(photosImageViewOne)
            make.height.equalTo(75)
         }
        
    }
    
    private func setSubviews() {
        contentView.addSubviews(photosLabel)
        contentView.addSubviews(arrowImageView)
        contentView.addSubviews(photosImageViewOne)
        contentView.addSubviews(photosImageViewTwo)
        contentView.addSubviews(photosImageViewThree)
        contentView.addSubviews(photosImageViewFour)
    }

}
