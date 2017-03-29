//
//  MineViewController.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/15.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {

    var sectionArr = ["给个笑脸", "意见反馈", "免责声明"]
    var sectionArray = ["关于", "朋友需要"]
    var imageArr = ["comedy", "message", "nook"]
    var imageArray = ["wink", "pretzel"]
    var headerView:MineHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame:self.view.bounds, style: .grouped)
        
    }

}

extension MineViewController
{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else if section == 1{
            return 3
        }else if section == 2{
            return 2
        }else if section == 3{
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = UITableViewCell()
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        if indexPath.section == 0 {
            cell.textLabel?.text = "我的收藏"
            cell.imageView?.image = UIImage(named:"hearts")
            cell.accessoryType = .disclosureIndicator

        }else if indexPath.section == 1{
            cell.textLabel?.text = sectionArr[indexPath.row]
            cell.imageView?.image = UIImage(named:imageArr[indexPath.row])
            cell.accessoryType = .disclosureIndicator

        }else if indexPath.section == 2{
            cell.textLabel?.text = sectionArray[indexPath.row]
            cell.imageView?.image = UIImage(named:imageArray[indexPath.row])
            cell.accessoryType = .disclosureIndicator

        }else if indexPath.section == 3{
            cell.textLabel?.text = "立即登录"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = UIColor.red
        }
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView = MineHeaderView()
       return section == 0 ? headerView: nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return section == 0 ? 120: 0
    }
    
}
