//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 18.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var photoGallery: Photo? {
        didSet {
            guard let photoGallery = photoGallery else { return }
            imageView.image = photoGallery.image
        }
    }
    
     let imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    func setupLayout() {
        
        contentView.addSubviews(imageView)
        
        imageView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.top.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.right.equalTo(contentView)
         }
    }
    
}
