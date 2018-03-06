
//
//  UIView+AD.swift
//  merchant
//
//  Created by beequick on 2018/1/12.
//  Copyright © 2018年 beequick. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var x:CGFloat {
        return self.frame.origin.x
    }
    var y: CGFloat {
        return self.frame.origin.y
    }
    var right: CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    var bottom: CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    var height: CGFloat {
        
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        
    }
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            var c = self.center
            c.x = newValue
            self.center = c
        }
    }
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            var c = self.center
            c.y = newValue
            self.center = c
        }
    }
    func presentViewController() -> UIViewController {
        var next:UIResponder?
        next = self.next!
        
        repeat {
            if ((next as?UIViewController) != nil) {
                return (next as! UIViewController)
            }else {
                next = next?.next
            }
        } while next != nil
        
        return UIViewController()
    }
    
    func removeAllSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
}
