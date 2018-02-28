//
//  AAURLSessionConfiguration.swift
//  merchant
//
//  Created by beequick on 2018/1/24.
//  Copyright © 2018年 beequick. All rights reserved.
//

import UIKit
//import ObjectiveC

class AAURLSessionConfigurations: NSObject {
    static let defaultConfiguration = AAURLSessionConfigurations()
    var isSwizzle = false
    override init() {
        super.init()
    }
    
    func load() {
        isSwizzle = true
        var cls: AnyClass?
        if NSClassFromString("__NSCFURLSessionConfiguration") != nil {
            cls = NSClassFromString("NSURLSessionConfiguration")
        }
        let alter = #selector(protocolClasses)

        let originalMethod = class_getInstanceMethod(cls, alter)
        let stuMethod = class_getInstanceMethod(AAURLSessionConfigurations.classForCoder(), alter)
        if originalMethod != nil || stuMethod != nil {
            return
        }
        method_exchangeImplementations(originalMethod, stuMethod)
    }
    func unload() {
        isSwizzle = false

    }
    func protocolClasses() -> [AnyClass] {
        return [NetEyeProtocol.classForCoder()]
    }
}
