//
//  CreamTableViewCell.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/30.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class CreamTableViewCell: UITableViewCell {
    
    /** 头像 */
    var headImageView = UIImageView()
    /** 星级 */
    var startView = UIImageView()
    /** 大的预览图 */
    var bigPicView = UIImageView()
    /** 地区 */
    var locationBtn = UILabel()
    /** 直播名 */
    var nameLabel = UILabel()
    /** 观众 */
    var audienceLabel = UILabel()
    
    var cream: CreamModel? {
        didSet{
            headImageView.kf.setImage(with: URL(string: cream!.smallpic), placeholder: UIImage(named: "placeholder_head"), options: nil, progressBlock: nil, completionHandler: { (image, err, cache, url) in
                let image = UIImage.circleImage(originImage: image!, borderColor: UIColor.purple, borderWidth: 1)
                self.headImageView.image = image
            })
            
            self.nameLabel.text = cream!.myname
            
            // 如果没有地址, 给个默认的地址
            //locationBtn.setTitle(cream!.gps ?? "喵星", for: .normal)
            //locationBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            //locationBtn.setTitleColor(UIColor.black, for: .normal)
            locationBtn.text = cream!.gps ?? "喵星"
            locationBtn.font = UIFont.systemFont(ofSize: 13)
            locationBtn.textAlignment = .left
            
            bigPicView.kf.setImage(with: URL(string: cream!.bigpic), placeholder: #imageLiteral(resourceName: "profile_user_414x414"))
            
            self.startView.image  = cream!.starImage
            self.startView.isHidden = (cream!.starlevel! == 0)
            
            // 设置当前观众数量
            let fullAudience: NSString = "\(cream!.allnum!)人在看" as NSString
            let range = fullAudience.range(of: "\(cream!.allnum!)")
            let attr = NSMutableAttributedString(string: fullAudience as String)
            attr.addAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 16),NSForegroundColorAttributeName: UIColor(r:216,g: 41,b: 116)], range: range)
            self.audienceLabel.textAlignment = .right
            self.audienceLabel.attributedText = attr
        }
    }
    
    static func cellWithTableView(table: UITableView) -> CreamTableViewCell{
        let cellId  = "creamCell"
        var cell = table.dequeueReusableCell(withIdentifier: cellId)
        if  cell == nil {
            cell = CreamTableViewCell(style: .default, reuseIdentifier: cellId)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        return (cell as? CreamTableViewCell)!
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CreamTableViewCell
{
    func setUpUI() {
        addSubview(headImageView)
        addSubview(nameLabel)
        addSubview(startView)
        addSubview(locationBtn)
        addSubview(audienceLabel)
        addSubview(bigPicView)
        
        
        headImageView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(10)
            make.width.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(headImageView.snp.right).offset(5)
            make.width.equalTo(120)
            make.height.equalTo(20)
        }
        
        startView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(nameLabel.snp.right).offset(5)
            make.width.equalTo(40)
            make.height.equalTo(20)
        }
        //观众
        audienceLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(35)
            make.right.equalToSuperview().offset(-5)
            make.width.equalTo(150)
            make.height.equalTo(20)
        }
        
        locationBtn.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(headImageView.snp.right).offset(5)
            make.width.equalTo(120)
            make.height.equalTo(20)
        }
        
        bigPicView.snp.makeConstraints { (make) in
            make.top.equalTo(headImageView.snp.bottom).offset(10)
            make.right.left.equalToSuperview()
            make.height.equalTo(375)
        }
    }
}
