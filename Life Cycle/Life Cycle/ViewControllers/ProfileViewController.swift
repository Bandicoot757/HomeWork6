//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 26.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    // Временно включен navigationBar и доступна кнопка "Back". Будет убрано после реализации выхода из аккаунта
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .white
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        return tableView
    }()
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        view.addSubviews(tableView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeArea)
            make.left.equalTo(safeArea)
            make.bottom.equalTo(safeArea)
            make.right.equalTo(safeArea)
        }

    }
    
}

extension ProfileViewController: UITableViewDelegate {
    
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return DataSource.publications.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
            return cell
            
        } else {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
            let posts = DataSource.publications
            let post = posts[indexPath.row]
            cell.configure(post: post)
        
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard section == 0 else { return nil }
        
        let viewForHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! ProfileHeaderView
        
        return viewForHeader
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
            let destinationVC = PhotosViewController()
            destinationVC.modalPresentationStyle = .fullScreen
            self.show(destinationVC, sender: self)
    
        }
    }
    
}
