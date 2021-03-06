//
//  PlayMusicViewController.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/17.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit
import Jukebox

private var currentMusicContext = 0

class PlayMusicViewController: UIViewController,PlayTopViewDelegate{
    //背景图片
    var backgroudView = UIImageView()
    var topView = PlayTopView()
    
    lazy var musicArr = [SongDetail]()
    dynamic var currentMusic: MusicModel?
    
    var playingIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setSongIdArray(musicArr:[SongDetail], currentIndex: NSInteger)  {
        self.musicArr = musicArr
        self.playingIndex = currentIndex
        loadSongDetail()
    }
    
}
//MARK: UI
extension PlayMusicViewController
{
    func setUpUI() {
        
        backgroudView = UIImageView()
        backgroudView.frame = self.view.frame
        self.view.addSubview(backgroudView)
        
        topView = PlayTopView()
        topView.delegate = self;
        topView.frame = CGRect(x: 0, y: 40, width:self.view.frame.size.width, height: 50)
        self.view.addSubview(topView)
        
        
        let bottomView = PlayBottomView()
        self.view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(128)
        }
        
    }
}

//MARK:Data
extension PlayMusicViewController
{
    func loadSongDetail()  {
        
        let parameters: [String: Any] = ["songIds": self.musicArr[playingIndex].song_id]
        NetWorkTool.requestData(type: .get, urlString: "http://ting.baidu.com/data/music/links", parameters: parameters, succeed: { (result, error) in
            guard let resultDic = result as? [String: Any] else{
                return
            }
            
            guard let resultDictArray = resultDic["data"] as? [String: Any] else{
                return
            }
            guard let dataArr = resultDictArray["songList"] as? [[String: Any]] else{
                return
            }
            
            self.currentMusic = MusicModel(dict: dataArr.first!)
            self.setUpOnce()
            
        }) { (error) in
            self.showHint(hint: "播放失败")
        }
    }
}

extension PlayMusicViewController{
    
    func setUpOnce() {
        
        backgroudView.kf.setImage(with: URL(string: (currentMusic?.songPicBig)!), placeholder: #imageLiteral(resourceName: "dzq"))
        
        topView.music = currentMusic
        
       let jukebox = Jukebox(delegate: self as? JukeboxDelegate, items: [
            JukeboxItem(URL: NSURL(string: currentMusic!.songLink)! as URL)
            ])
        jukebox?.play()
        
    }
}

extension PlayMusicViewController
{
    
}
//MARK:   delegate
extension PlayMusicViewController{
    func backBtnClick() {
     navigationController?.popViewController(animated: false)
    }
}
