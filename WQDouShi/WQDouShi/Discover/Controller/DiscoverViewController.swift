//
//  DiscoverViewController.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/15.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class DiscoverViewController: UITableViewController,DiscoverTableViewCellDelegate ,ZFPlayerDelegate{
    
    fileprivate lazy var dataArr = [VideoListModel]()
    fileprivate lazy var playerView: ZFPlayerView = {
        let playerView = ZFPlayerView()
        playerView.delegate = self
        playerView.stopPlayWhileCellNotVisable = true
        return playerView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        getData()
    }
    
}
extension DiscoverViewController
{
    fileprivate func getData(){
        let path = Bundle.main.path(forResource: "videoData", ofType: "json")
        let data = NSData(contentsOfFile: path!) as! Data
        guard  let rootDic = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            return
        }
        
        guard let videoList = rootDic?["videoList"]! as? [[String: Any]] else {
            return
        }
        
        for dict in videoList{
            let model = VideoListModel(dict: dict)
            dataArr.append(model)
        }
        tableView.reloadData()
    }
}

extension DiscoverViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = DiscoverTableViewCell.cellWithTableView(table: tableView)
        cell.delegate = self
        cell.model = self.dataArr[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
}
//MARK:  DiscoverTableViewCellDelegate
extension DiscoverViewController
{
    func palayVedio(cell: DiscoverTableViewCell, model: VideoListModel) {
        let dic = NSMutableDictionary()
        for resolution in model.playInfo{
            dic.setValue(resolution.url, forKey: resolution.name)
        }
        let VideoUrl = URL(string:(dic.allValues.first as? String)!)!
        let playModel = ZFPlayerModel()
        playModel.title = model.title
        playModel.videoURL = VideoUrl
        playModel.placeholderImageURLString = model.coverForFeed
        playModel.tableView = self.tableView
        playModel.indexPath = tableView.indexPath(for: cell)
        playModel.resolutionDic = NSDictionary(dictionary:dic) as! [AnyHashable: Any]
        playModel.fatherView = cell.picView
        playerView.playerControlView(ZFPlayerControlView(), playerModel: playModel)
        playerView.autoPlayTheVideo()
    }
}
