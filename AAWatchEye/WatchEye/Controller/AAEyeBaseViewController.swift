//
//  AAEyeBaseViewController.swift
//  merchant
//
//  Created by beequick on 2018/2/27.
//  Copyright © 2018年 beequick. All rights reserved.
//

import UIKit

class AAEyeBaseViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setDismissNavItem() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backOff))
    }

    func setNavTitle(_ title:String) {
        let titleL = UILabel()
        titleL.text = title
        titleL.textAlignment = .center
        titleL.sizeToFit()
        titleL.font = UIFont.systemFont(ofSize: 18)
        titleL.textColor = UIColor.black
        self.navigationItem.titleView = titleL
    }
    
    func backOff() {
        self.dismiss(animated: true) {
            AAWatchEye.share.show = false
            UIApplication.shared.statusBarStyle = .lightContent
        }
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
