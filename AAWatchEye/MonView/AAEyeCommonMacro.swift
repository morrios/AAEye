
//
//  AAEyeCommonMacro.swift
//  merchant
//
//  Created by beequick on 2018/2/11.
//  Copyright © 2018年 beequick. All rights reserved.
//

import Foundation
import UIKit


var isIPhoneX: Bool {
    if UIScreen.main.currentMode?.size.height==2436 {
        return true
    }
    return false
}

var ADNavBarHeight: CGFloat {
    return (isIPhoneX ? 88.0 : 64.0)
}

var ADTabBarHeight: CGFloat {
    return (isIPhoneX ? 83.0 : 49.0)
}

var ADTabBarHeight_Add: CGFloat {
    return (isIPhoneX ? 34.0 : 0.0)
}

var ADStatusBarHeight: CGFloat {
    return (isIPhoneX ? 44.0 : 20.0)
}

