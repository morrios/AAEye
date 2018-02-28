
//
//  UIColor+AA.swift
//  merchant
//
//  Created by beequick on 2018/1/12.
//  Copyright © 2018年 beequick. All rights reserved.
//

import Foundation
import UIKit
// MARK{- 把#ffffff颜色转为UIColor
extension UIColor {
    class func colorWithHexString(hex:String) ->UIColor {
        
        var cString = hex.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            let index = cString.index(cString.startIndex, offsetBy:1)
            cString = cString.substring(from: index)
        }
        
        if (cString.count != 6) {
            return UIColor.red
        }
        
        let rIndex = cString.index(cString.startIndex, offsetBy: 2)
        let rString = cString.substring(to: rIndex)
        let otherString = cString.substring(from: rIndex)
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString = otherString.substring(to: gIndex)
        let bIndex = cString.index(cString.endIndex, offsetBy: -2)
        let bString = cString.substring(from: bIndex)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    /**
     *  主色系
     */
    class func ca() ->UIColor {
       return self.colorWithHexString(hex: "#FD9526")//E6773B
        
    }
    /**
     *  主色系
     */
    class func EyeA() ->UIColor {
        return self.colorWithHexString(hex: "#E6773B")//E6773B
        
    }
    /**
     *  默认背景颜色
     */
    class func cb() ->UIColor  {
    return self.colorWithHexString(hex: "#F5F5F5")
    }
    
    class func c1() ->UIColor  {
    return self.colorWithHexString(hex: "#2e333a")
    }
    
    class func c2() ->UIColor {
    return self.colorWithHexString(hex: "#727b88")
    }
    
    class func c3() ->UIColor {
    return self.colorWithHexString(hex: "#b7bdc6")
    }
    
    class func c4() ->UIColor {
    return self.colorWithHexString(hex: "#d1d9e4")
    }
    
    class func c5() ->UIColor {
    return self.colorWithHexString(hex: "#dbe0e8")
    }
    
    class func c6() ->UIColor {
    return self.colorWithHexString(hex: "#ebeff5")
    }
    
    class func c7() ->UIColor {
    return self.colorWithHexString(hex: "#f2f5f8")
    }
    
    class func c8() ->UIColor {
    return self.colorWithHexString(hex: "#ffffff")
    }

}
