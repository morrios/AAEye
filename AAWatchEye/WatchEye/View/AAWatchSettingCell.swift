//
//  AAWatchSettingCell.swift
//  merchant
//
//  Created by beequick on 2018/3/6.
//  Copyright © 2018年 beequick. All rights reserved.
//

import UIKit
protocol WatchSettingCellDelegate: class {
    
    func switchAction(in cell: AAWatchSettingCell, isOn: Bool);
    
    
}
class AAWatchSettingCell: UITableViewCell {
    var lable = UILabel()
    var switchV = UISwitch()
    var delegate: WatchSettingCellDelegate?
    var detailStr: String = ""{
        didSet{
            lable.text = detailStr
            lable.sizeToFit()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        lable = UILabel(frame: CGRect(x: 15, y: 0, width: 10, height: 10))
        
        lable.font = UIFont.systemFont(ofSize: 13)
        lable.textAlignment = .left
        lable.textColor = UIColor(red: 0.24, green:0.51, blue:0.78, alpha:1.00)
        self.addSubview(lable)
        
        switchV = UISwitch(frame: CGRect(x: (self.width-75), y: 0, width: 10, height: 10))
        switchV.addTarget(self, action: #selector(switchAction(sender:)), for: .valueChanged)
        self.addSubview(switchV)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        lable.height = self.height
        switchV.centerY = self.height*0.5
    }
    
    func switchAction(sender: UISwitch) {
        if delegate != nil {
            delegate?.switchAction(in: self, isOn: sender.isOn)
        }
    }
    

}
