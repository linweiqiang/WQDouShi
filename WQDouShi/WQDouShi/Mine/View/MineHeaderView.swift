//
//  MineHeaderView.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/29.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class MineHeaderView: UIView {

    lazy var iconImg = UIImageView()
    lazy var nameL = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        iconImg.image = UIImage(named:"default-user")
        nameL.text = "what you name!!!"
        nameL.textAlignment = .center
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MineHeaderView
{
    func setUpUI() {
        
        addSubview(iconImg)
        addSubview(nameL)
        
        iconImg.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(70)
        }
        
        nameL.snp.makeConstraints { (make) in
            make.top.equalTo(iconImg.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalTo(180)
            make.height.equalTo(25)
        }
    }
}
