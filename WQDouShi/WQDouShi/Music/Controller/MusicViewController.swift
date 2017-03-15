//
//  MusicViewController.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/15.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

private let MusicCellId = "MusicCellId"

class MusicViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{

    lazy var dataSource = [SongGroup]()
    lazy var collectionView: UICollectionView = {[unowned self] in
        // 1.创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: MGScreenW, height: MGScreenW*0.4)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        // 2.创建UICollectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(MusicCollectionCell.self, forCellWithReuseIdentifier: MusicCellId)
        return collectionView
        
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        //
        reloadData()
    }

}
//MARK: data
extension MusicViewController
{
    fileprivate func reloadData(){
         let parameters: [String: Any] = ["method":"baidu.ting.billboard.billCategory","kflag":"1","from":"ios","version":"5.5.6","channel":"appstore","operator":"1","format":"json"]
        
        NetWorkTool.requestData(type: .get, urlString: "http://tingapi.ting.baidu.com/v1/restserver/ting", parameters: parameters, succeed: { (result, error) in
            // 1.将result转成字典类型
            guard let resultDict = result as? [String : Any] else { return }
            
            // 2.根据data该key,获取数组
            guard let dataArray = resultDict["content"] as? [[String : Any]] else { return }
            
            for mdict in dataArray {
                self.dataSource.append(SongGroup(dict: mdict))
            }
            
           self.collectionView.reloadData()
        }) { (error) in
            if error != nil {
                self.showHint(hint: "网络请求错误")
            }
        }
    }
}
//MARK: UICollectionViewDelegate  UICollectionViewDataSource
extension MusicViewController{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCellId, for: indexPath) as! MusicCollectionCell
        cell.model = dataSource[indexPath.item]
        return cell
    }
}
