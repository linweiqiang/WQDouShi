//
//  DiscoverTableViewCell.swift
//  WQDouShi
//
//  Created by yoke2 on 2017/3/22.
//  Copyright © 2017年 yoke121. All rights reserved.
//

import UIKit

protocol DiscoverTableViewCellDelegate: NSObjectProtocol {
    func palayVedio(cell:DiscoverTableViewCell, model: VideoListModel)
}
class DiscoverTableViewCell: UITableViewCell {

    var icon = UIImageView()
    var title = UILabel()
    var time = UILabel()
    var videoDescription = UILabel()
    var picView = UIImageView()
    
    var playBtn = UIButton()
    
    weak var delegate: DiscoverTableViewCellDelegate?
    
    var model: VideoListModel?{
        didSet{
            icon.kf.setImage(with: URL(string:(model?.coverForFeed)!))
            
            title.text = model?.title
            
            time.text = timeStamp(timeStr: Double(model!.date!))
            
            videoDescription.text = model?.videoDescription
            
            picView.kf.setImage(with: URL(string: (model?.coverForFeed)!))
        }
    }
    
    override init(style:UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        title.font = UIFont.systemFont(ofSize: 13)
        time.font = UIFont.systemFont(ofSize: 10)
        videoDescription.font = UIFont.systemFont(ofSize: 13)
        videoDescription.numberOfLines = 0
        videoDescription.lineBreakMode = .byTruncatingTail
    playBtn.setBackgroundImage(UIImage(named:"video_list_cell_big_icon"), for: .normal)
        playBtn.addTarget(self, action: #selector(DiscoverTableViewCell.ClickPlayVedio), for: .touchUpInside)
        picView.isUserInteractionEnabled = true
        setUpUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func cellWithTableView(table: UITableView) -> DiscoverTableViewCell {
        let cellId = "DiscoverTableViewCellId"
        var cell = table.dequeueReusableCell(withIdentifier: cellId)
        if  cell == nil {
            cell = DiscoverTableViewCell(style: .default, reuseIdentifier: cellId)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        return cell as! DiscoverTableViewCell
    }
    
    func timeStamp(timeStr: Double) -> String {
        let detaildate = Date(timeIntervalSince1970: timeStr/1000.0)
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-mm-dd HH:MM:SS"
        let dateStr = dateFormatter.string(from: detaildate)
        return dateStr
        
    }
    func setUpUI() {
        
        addSubview(icon)
        addSubview(title)
        addSubview(time)
        addSubview(videoDescription)
        addSubview(picView)
        picView.addSubview(playBtn)
        
        icon.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(15)
            make.width.height.equalTo(30)
        }
        
        title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.left.equalTo(icon.snp.right).offset(10)
            make.height.equalTo(15)
            make.width.equalTo(200)
        }
        
        time.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom)
            make.left.equalTo(icon.snp.right).offset(10)
            make.height.equalTo(15)
            make.width.equalTo(200)
        }
        
        videoDescription.snp.makeConstraints { (make) in
            make.top.equalTo(icon.snp.bottom).offset(0)
            make.left.right.equalToSuperview().offset(5)
            make.height.equalTo(80)
        }
        
        picView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.right.left.equalToSuperview()
            make.height.equalTo(210)
        }
        
        playBtn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(50)
        }
    }
}
extension DiscoverTableViewCell
{
    func ClickPlayVedio() {
       delegate?.palayVedio(cell: self, model: model!)
    }
}
