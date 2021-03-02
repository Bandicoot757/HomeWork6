//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 18.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

final class PhotosViewController: UIViewController, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self))
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white

        return collectionView
    }()
    
    override func viewWillLayoutSubviews() {
        
        view.addSubviews(collectionView)
        
        let safeArea = view.safeAreaLayoutGuide
        
            collectionView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeArea)
            make.left.equalTo(safeArea)
            make.bottom.equalTo(safeArea)
            make.right.equalTo(safeArea)
        }
        
    }

}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataSource.photoGallery.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosCollectionViewCell.self), for: indexPath) as! PhotosCollectionViewCell
        
        cell.photoGallery = DataSource.photoGallery[indexPath.item]
        
        return cell
    }
        
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    var offset: CGFloat {
        return 8
    }
    
    func collectionView(_: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - offset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: offset, left: offset, bottom: offset, right: offset)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return offset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return offset
    }
    
}
