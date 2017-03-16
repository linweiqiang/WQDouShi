//
//  MusicListTableViewCell.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/16.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

class MusicListTableViewCell: UITableViewCell {
    
    lazy var iconImageView = UIImageView()
    lazy var songNameL = UILabel()
    lazy var singerL = UILabel()
    
    
    var model: SongDetail? {
        didSet{
            iconImageView.kf.setImage(with: URL(string:(model?.pic_small)!), placeholder: #imageLiteral(resourceName: "mybk1"))
            songNameL.text = model?.title
            singerL.text = (model?.author)! + " " + (model?.album_title)!
        }
    }
    
    static func cellWithTableView(table: UITableView) -> MusicListTableViewCell{
        let cellId = "cellId"
        
        var  cell = table.dequeueReusableCell(withIdentifier: cellId) as? MusicListTableViewCell
        if cell == nil {
            cell = MusicListTableViewCell(style:.default, reuseIdentifier: cellId)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none;
        }
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.backgroundColor = UIColor.clear
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        self.layoutIfNeeded()
        self.iconImageView.layer.cornerRadius = iconImageView.mg_width * 0.5;
        self.iconImageView.layer.masksToBounds = true;
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK:UI
extension MusicListTableViewCell
{
    fileprivate func setUI(){
        addSubview(iconImageView)
        addSubview(songNameL)
        addSubview(singerL)
        
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(70)
            make.width.equalTo(iconImageView.snp.height)

        }
        
        songNameL.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.top.equalTo(iconImageView).offset(3)
            make.right.equalToSuperview().offset(-15)
        }
        
        singerL.snp.makeConstraints { (make) in
            make.left.right.equalTo(songNameL)
            make.bottom.equalTo(iconImageView).offset(-3)
        }
    }
}
