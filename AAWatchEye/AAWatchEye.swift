//
//  AAWatchEyeManager.swift
//  merchant
//
//  Created by beequick on 2018/1/23.
//  Copyright © 2018年 beequick. All rights reserved.
//

import UIKit

class AAWatchEye:NSObject {
    static let share = AAWatchEye()
    var eyeButton = AAExpandedTouchAreaButton()
    var show = false
    let window = UIApplication.shared.keyWindow!

    private override init (){
        super.init()
        initEyeButton()
        AAWatchEyeURLProtocol.setEnabled(true)
    }
    
    func initEyeButton() {
        let norImg = UIImage(named: "AAMonEye")
        let selImg = UIImage(named: "AAMonEye")
        let size = UIScreen.main.bounds.size
        let x = size.width*0.5 + 30
        let frame = CGRect(x: x, y: 0, width: 15, height: 8)
        eyeButton.frame = frame
        eyeButton.centerY = 20*0.5
        eyeButton.expandedTouchAreaInsets = UIEdgeInsetsMake(20, 20, 20, 20)
        eyeButton.setImage(norImg, for: .normal)
        eyeButton.setImage(selImg, for: .selected)
        eyeButton.addTarget(self, action: #selector(eyeButtonClick(sender:)), for: .touchUpInside)
        window.addSubview(eyeButton)
        window.bringSubview(toFront: eyeButton)
        
        window.addObserver(self, forKeyPath: "rootViewController", options: .new, context: nil)
        
    }
    deinit {
        window.removeObserver(self, forKeyPath: "rootViewController")
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        window.bringSubview(toFront: eyeButton)

    }
    
    func eyeButtonClick(sender:UIButton) {
        if !show {
            let tabbar = UITabBarController()
            let device = AADeviceViewController()
            let deviceNav = UINavigationController(rootViewController: device)
            
            let net = AANetTableViewController()
            let netNav = UINavigationController(rootViewController: net)
            
            let setting = AAWatchSettingController()
            let setNav = UINavigationController(rootViewController: setting)
            
            tabbar.addChildViewController(netNav)
            tabbar.addChildViewController(deviceNav)
            tabbar.addChildViewController(setNav)

            deviceNav.tabBarItem.title = "Devices"
            netNav.tabBarItem.title = "NetMonitor"
            setNav.tabBarItem.title = "setting"
            
            window.rootViewController?.present(tabbar, animated: true, completion: {
                self.show = true
                UIApplication.shared.statusBarStyle = .default
            })
        }
        
    }
    
}



class AAExpandedTouchAreaButton: UIButton {
    var expandedTouchAreaInsets = UIEdgeInsets()
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var frame = self.bounds
        let inset = UIEdgeInsetsMake(-expandedTouchAreaInsets.top, -expandedTouchAreaInsets.left, -expandedTouchAreaInsets.bottom, -expandedTouchAreaInsets.right)
        frame = UIEdgeInsetsInsetRect(frame, inset)
        return frame.contains(point)
    }
}
