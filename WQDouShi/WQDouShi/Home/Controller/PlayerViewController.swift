//
//  PlayerViewController.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/31.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    var creame: CreamModel!
    var ijPlayer: IJKMediaPlayback!
    var playerView: UIView!

    var backBtn: UIButton = {
        
        //返回按钮
        let backBtn = UIButton(type: .custom)
        backBtn.frame = CGRect(x: 10, y: 20, width: 40, height: 40)
        backBtn.setBackgroundImage(UIImage(named:"goback"), for: .normal)
        backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        return backBtn
        
    }()
    
    var backGroundImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackGoundImg()
        
    }
    //开始播放
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setPlayerView()

        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        if !self.ijPlayer.isPlaying(){
            ijPlayer.prepareToPlay()
        }else {
            ijPlayer.prepareToPlay()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if ijPlayer != nil{
            ijPlayer.shutdown()
            ijPlayer.view.removeFromSuperview()
            ijPlayer = nil
        }
    }
}

extension PlayerViewController
{
    func setBackGoundImg() {
        backGroundImg = UIImageView()
        backGroundImg.frame = self.view.bounds
        let imgUrl = URL(string:creame.bigpic!)
        backGroundImg.kf.setImage(with: imgUrl, placeholder: UIImage(named:"10"))
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = backGroundImg.bounds
        backGroundImg.addSubview(effectView)
        self.view.addSubview(backGroundImg)
    }
}
extension PlayerViewController
{
    func setPlayerView() {
        self.playerView = UIView(frame: MGScreenBounds)
        view.addSubview(playerView)
        ijPlayer = IJKFFMoviePlayerController(contentURLString: creame.flv!, with: nil)
        let playerV = ijPlayer.view!
        playerV.frame = playerView.bounds
        playerV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        playerV.addSubview(backBtn)
        playerView.insertSubview(playerV, at: 1)
        ijPlayer.scalingMode = .aspectFill
    }
}

extension PlayerViewController{
    func back() {
        navigationController?.popViewController(animated: true)
    }
}
