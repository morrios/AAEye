//
//  AADeviceViewController.swift
//  merchant
//
//  Created by beequick on 2018/2/27.
//  Copyright © 2018年 beequick. All rights reserved.
//

import UIKit

class AADeviceViewController: AAEyeBaseViewController {
    var tableview = UITableView()
    var cellTities = ["设备型号","iPhone名称","系统版本","app版本号","wifi","IP地址"]
    var cellDetails = [UIDevice.current.type.rawValue,
                       UIDevice.current.phoneName,
                       UIDevice.current.version,
                       UIDevice.current.appVersion + " (\(UIDevice.current.appBuild))",
                       AADevies.share.wifiName,
                       AADevies.share.GetIPAddresses]
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setDismissNavItem()

        self.view.backgroundColor = UIColor.white
        tableview = UITableView(frame: self.view.frame, style: .plain)
        tableview.dataSource = self
        tableview.delegate = self
        self.view.addSubview(tableview)
        print(UIDevice.current.type)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AADeviceViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return cellTities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableview.dequeueReusableCell(withIdentifier: "idcell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "idcell")
        }
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
        cell?.textLabel?.textColor = UIColor(red: 0.24, green:0.51, blue:0.78, alpha:1.00)

        
        cell?.textLabel?.text = cellTities[indexPath.row]
        
        var titleColor = UIColor(red: 0.96, green: 0.15, blue: 0.11, alpha: 1)
//        if currenModel.responseStatusCode == 200 {
//            titleColor = UIColor(red: 0.11, green: 0.76, blue: 0.13, alpha: 1)
//        }
  
        
       
        cell?.detailTextLabel?.text = cellDetails[indexPath.row]
        return cell!
    }
    
}

extension AADeviceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
