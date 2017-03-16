//
//  MusicListTableViewController.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/16.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class MusicListTableViewController: UITableViewController {
    
    var dataArr = [SongDetail]()
    var songGroup : SongGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 90
        setUI()
        loadData()
        
    }
    init(songGroup: SongGroup) {
        super.init(style: .plain)
        self.songGroup = songGroup
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK:UI
extension MusicListTableViewController
{
    fileprivate func setUI(){
        //背景
        let bgView = UIImageView(frame: self.view.frame)
        bgView.kf.setImage(with: URL(string: (songGroup?.pic_s444)!), placeholder: #imageLiteral(resourceName: "mybk1"))
        let effect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = bgView.frame
        bgView.addSubview(effectView)
        self.tableView.backgroundView = bgView
        
        
        //头部视图
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: MGScreenW, height: MGScreenW*0.5))
        let image = UIImageView(frame: headerView.frame)
        image.kf.setImage(with: URL(string: (songGroup?.pic_s444)!), placeholder: #imageLiteral(resourceName: "mybk1"))
        let nameLable = UILabel(frame:  CGRect(x: 20, y: MGScreenW*0.42, width: MGScreenW, height: 25))
        nameLable.textColor = UIColor.white
        nameLable.text = self.songGroup?.name
        headerView.addSubview(image)
        headerView.addSubview(nameLable)
        tableView.tableHeaderView = headerView
    }

    
}
//MARK:loadData
extension MusicListTableViewController{
    func loadData() {
        let parameters: [String: Any] = ["method":"baidu.ting.billboard.billList","offset":"0","size":"100","type":self.songGroup!.type,"from":"ios","version":"5.5.6","channel":"appstore","operator":"1","format":"json"]
        NetWorkTool.requestData(type: .get, urlString: "http://tingapi.ting.baidu.com/v1/restserver/ting", parameters: parameters, succeed: { (result, error) in
            guard let resultDic = result as? [String: Any] else{
                return
            }
            
            guard let dataArray = resultDic["song_list"] as? [[String: Any]] else{return}
            
            for adic in dataArray{
                self.dataArr.append(SongDetail(dict: adic))
            }
            
            self.tableView.reloadData()
            
        }) { (error) in
            if error != nil{
                self.showHint(hint: "网络请求错误")
                
            }
        }
    }
}
// MARK: - Table view data source
extension MusicListTableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MusicListTableViewCell.cellWithTableView(table: tableView)
        cell.model = self.dataArr[indexPath.row]
        return cell
    }
}
