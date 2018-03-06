//
//  AAWatchSettingController.swift
//  merchant
//
//  Created by beequick on 2018/3/6.
//  Copyright © 2018年 beequick. All rights reserved.
//

import UIKit

class AAWatchSettingController: AAEyeBaseViewController {
    var tableview = UITableView()
    var cellTities = ["视图layer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setDismissNavItem()
        self.setNavTitle("设置")
        self.view.backgroundColor = UIColor.white
        tableview = UITableView(frame: self.view.frame, style: .plain)
        tableview.dataSource = self
        self.view.addSubview(tableview)
        tableview.register(AAWatchSettingCell.self, forCellReuseIdentifier: "idcell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func changeVCSubviews(_ viewController: UIViewController) {
        if viewController.childViewControllers.count > 0 {
            for child in viewController.childViewControllers {
                changeVCSubviews(child)
            }
        }else{
            ShowViewLayer(viewController.view)
        }
    }
    
    func ShowViewLayer(_ view: UIView) {
        for subview in view.subviews {
            subview.layer.borderColor = UIColor.ca().cgColor
            subview.layer.borderWidth = CGFloat(1)
            ShowViewLayer(subview)
        }
    }

}
extension AAWatchSettingController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "idcell") as! AAWatchSettingCell
        cell.detailStr = cellTities[indexPath.row]
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
}

extension AAWatchSettingController: WatchSettingCellDelegate {
    func switchAction(in cell: AAWatchSettingCell, isOn: Bool) {
        let root = UIApplication.shared.keyWindow?.rootViewController
        changeVCSubviews(root!)
        
    }
}
