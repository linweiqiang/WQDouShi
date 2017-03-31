//
//  CreamTableViewController.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/30.
//  Copyright © 2017年 yoke121. All rights reserved.
//  首页_精华

import UIKit

class CreamTableViewController: UITableViewController {

    lazy var CreamVM = CreamViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        loadData()
    }
  
}

extension CreamTableViewController
{
    func loadData() {
        CreamVM.getCreamData { (error) in
            self.tableView.reloadData()
        }
    }
}

extension CreamTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CreamVM.creams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = CreamTableViewCell.cellWithTableView(table: tableView)
        if CreamVM.creams.count > 0 {
            let cream = CreamVM.creams[indexPath.row]
            cell.cream = cream
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.hidesBottomBarWhenPushed = true
        let creame = CreamVM.creams[indexPath.row]
        let playerVC = PlayerViewController()
        playerVC.creame = creame
        navigationController?.pushViewController(playerVC, animated: true)

    }
}
