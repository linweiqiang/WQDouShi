//
//  PlayBottomView.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/17.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class PlayBottomView: UIView {

    lazy var currentTime = UILabel()
    lazy var totalTime = UILabel()
    lazy var playBtn = UIButton()
    lazy var previousBtn = UIButton()
    lazy var nextBtn = UIButton()
    lazy var progress = UISlider()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        currentTime.text = "00:00"
        currentTime.textColor = UIColor.white
        
        totalTime.text = "00:00"
        totalTime.textColor = UIColor.white
        
        previousBtn.setImage(UIImage(named: "player_btn_pre_normal"), for: .normal)
        nextBtn.setImage(UIImage(named: "player_btn_next_normal"), for: .normal)
        playBtn.setImage(UIImage(named: "player_btn_pause_normal"), for: .normal)
        
        progress.maximumTrackTintColor = UIColor.gray
        progress.minimumTrackTintColor = UIColor.green
        progress.setThumbImage(#imageLiteral(resourceName: "player_slider_playback_thumb"), for: .normal)
        
        setUpUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: UI
extension PlayBottomView
{
    fileprivate func setUpUI(){
        addSubview(currentTime)
        addSubview(totalTime)
        addSubview(nextBtn)
        addSubview(playBtn)
        addSubview(previousBtn)
        addSubview(progress)
        
        currentTime.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(5)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        
        totalTime.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-5)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        playBtn.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-15)
            make.centerX.equalTo(self)
            make.width.height.equalTo(60)
        }
        previousBtn.snp.makeConstraints { (make) in
            make.right.equalTo(playBtn.snp.left).offset(-10)
            make.centerY.equalTo(playBtn)
            make.width.height.equalTo(55)
        }
        nextBtn.snp.makeConstraints { (make) in
            make.left.equalTo(playBtn.snp.right).offset(10)
            make.centerY.equalTo(playBtn)
            make.width.height.equalTo(55)
        }
        progress.snp.makeConstraints { (make) in
            make.centerY.equalTo(currentTime)
            make.left.equalTo(currentTime.snp.right).offset(5)
            make.right.equalTo(totalTime.snp.left).offset(-5)
            make.height.equalTo(20)
        }
    }
}

