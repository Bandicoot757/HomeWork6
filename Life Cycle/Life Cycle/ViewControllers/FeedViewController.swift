//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import iOSIntPackage

final class FeedViewController: UIViewController {
    
    var image = UIImage(named: "City")
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        editImage()
        view.backgroundColor = .white
    }
    
    // Далее очень тупой код, но мне лень выносить его в отдельные вьюхи для одной домашки
    
    private lazy var editImageButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("Наложить фильтр", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(editImage), for: .touchUpInside)
        return button
    }()
    
    private lazy var returnImageButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("Отменить", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(returnImage), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var pictureView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        imageView.image = image
        return imageView
    }()
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        
        view.addSubviews(editImageButton)
        view.addSubviews(returnImageButton)
        view.addSubviews(pictureView)
        pictureView.addSubviews(imageView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        editImageButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeArea).offset(16)
            make.left.equalTo(safeArea).offset(16)
            make.bottom.equalTo(pictureView.snp.top).offset(-32)
            make.width.equalTo(200)
        }
        
        returnImageButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeArea).offset(16)
            make.left.equalTo(editImageButton.snp.right).offset(16)
            make.right.equalTo(safeArea).offset(-16)
            make.bottom.equalTo(pictureView.snp.top).offset(-32)
        }
        
        pictureView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeArea).offset(100)
            make.left.equalTo(safeArea)
            make.right.equalTo(safeArea)
            make.centerX.equalTo(safeArea)
        }

        imageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(pictureView)
            make.left.equalTo(pictureView)
            make.right.equalTo(pictureView)
            make.centerX.equalTo(pictureView)
        }
        
    }
    
    @objc func editImage() {
        let processor = ImageProcessor()
        processor.processImage(sourceImage: image ?? UIImage(), filter: .sepia(intensity: 0.5), completion: {
            image in
            imageView.image = image
        })
    }
    
    @objc func returnImage() {
        imageView.image = image
    }
}
