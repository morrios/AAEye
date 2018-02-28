//
//  AANetTableViewController.swift
//  merchant
//
//  Created by beequick on 2018/2/11.
//  Copyright © 2018年 beequick. All rights reserved.
//

import UIKit

class AANetTableViewController: AAEyeBaseViewController {
    var tableview = UITableView()
    var datas = AAHTTPModelCache.share().allobjects()

    override init() {
        super.init()
        self.tabBarItem.title = "Device"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NetStrem"
        // Do any additional setup after loading the view.
        initNav()
        self.view.backgroundColor = UIColor.clear
        tableview = UITableView(frame: self.view.frame, style: .plain)
        tableview.dataSource = self
        tableview.delegate = self
        self.view.addSubview(tableview)
        print("datas = \(String(describing: self.datas))")
    }

    func initNav() {
        self.setDismissNavItem()
        let cleabBtn = UIButton(type: .system)
        cleabBtn.setTitle("clean", for: .normal)
        cleabBtn.addTarget(self, action: #selector(cleanNetRecod), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cleabBtn)
        
    }
    

    func cleanNetRecod() {
        AAHTTPModelCache.share().cleanAllRecode()
        datas = AAHTTPModelCache.share().allobjects()
        self.tableview.reloadData()
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
extension AANetTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if datas == nil {
            return 0
        }else {
            return datas!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableview.dequeueReusableCell(withIdentifier: "idcell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "idcell")
        }
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
        cell?.textLabel?.textColor = UIColor(red: 0.24, green:0.51, blue:0.78, alpha:1.00)
        let currenModel = self.datas![indexPath.row] as! NEHTTPModel
        cell?.textLabel?.text = currenModel.requestURLString
        
        var titleColor = UIColor(red: 0.96, green: 0.15, blue: 0.11, alpha: 1)
        if currenModel.responseStatusCode == 200 {
            titleColor = UIColor(red: 0.11, green: 0.76, blue: 0.13, alpha: 1)
        }
        
        let titleFont = UIFont.systemFont(ofSize: 12)
        let detailColor = UIColor.black
        let detailFont = UIFont.systemFont(ofSize: 12)
        
        let responseStr = "\(currenModel.responseStatusCode)   "
        let responseAttributes = [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor] as [String : Any]
        let responseStatusCode = NSMutableAttributedString(string: responseStr, attributes: responseAttributes)
        
        let dateStr = currenModel.startDateString
        let index = dateStr.index(dateStr.startIndex, offsetBy: 5)//获取字符d的索引
        let requestStr = "\(String(describing: currenModel.requestHTTPMethod!))   \(String(describing: currenModel.responseMIMEType!))   \(currenModel.startDateString.substring(from: index)))"
        let requestAttributes = [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor] as [String : Any]
        let requestHTTPMethod = NSMutableAttributedString(string: requestStr, attributes: requestAttributes)
        
        let detail = NSMutableAttributedString()
        detail.append(responseStatusCode)
        detail.append(requestHTTPMethod)
        cell?.detailTextLabel?.attributedText = detail
        return cell!
    }
    
}

extension AANetTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = AAHTTPEyeDetailViewController()
        detail.model = self.datas![indexPath.row] as! NEHTTPModel
        self.navigationController!.pushViewController(detail, animated: true)
    }
}
