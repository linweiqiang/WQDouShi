//
//  PlayTopView.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/17.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

protocol PlayTopViewDelegate: NSObjectProtocol {
    func backBtnClick()
}
class PlayTopView: UIView {

    var leftBtn = UIButton()
    var singerL = UILabel()
    var musicName = UILabel()//歌名label
    var backBtn = UIButton()
    
    weak var delegate: PlayTopViewDelegate?
    
    var music: MusicModel?{
        didSet{
            singerL.text = (music?.artistName)! + " " + (music?.albumName)!
            singerL.textAlignment = .center
            singerL.textColor = UIColor.white
            singerL.font = UIFont.systemFont(ofSize: 15)
            
            musicName.text = music?.songName
            musicName.textAlignment = .center
            musicName.textColor = UIColor.white
            musicName.font = UIFont.systemFont(ofSize: 15)
        }
    }

    
    override init(frame: CGRect){
        super.init(frame: frame)
        backBtn.addTarget(self, action:#selector(PlayTopView.backClick), for: .touchUpInside)
        setUpUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PlayTopView
{
    func setUpUI() {
        addSubview(leftBtn)
        addSubview(singerL)
        addSubview(musicName)
        addSubview(backBtn)
        
        self.backgroundColor = UIColor.clear
        
        leftBtn.setImage(UIImage(named: "menu"), for: .normal)
        backBtn.setImage(UIImage(named: "icon_ios_down"), for: .normal)
        
        leftBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        backBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        singerL.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(2)
            make.left.equalTo(leftBtn.snp.right).offset(5)
            make.right.equalTo(backBtn.snp.left).offset(5)
            make.height.equalTo(20)
        }
        musicName.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(2)
            make.left.equalTo(leftBtn.snp.right).offset(5)
            make.right.equalTo(backBtn.snp.left).offset(5)
            make.height.equalTo(20)
        }
    }
}

extension PlayTopView
{
    func backClick() {
       delegate?.backBtnClick()
    }
}
