//
//  File.swift
//  merchant
//
//  Created by beequick on 2018/1/24.
//  Copyright © 2018年 beequick. All rights reserved.
//

import Foundation
public protocol NetworkEyeDelegate: NSObjectProtocol {
    func networkEyeDidCatch(with request:URLRequest?,response:URLResponse?,data:Data?)
}

class WeakNetworkEyeDelegate: NSObject {
    weak var delegate : NetworkEyeDelegate?
    init (delegate: NetworkEyeDelegate) {
        super.init()
        self.delegate = delegate
    }
}


open class NetworkEye: NSObject {
    
    open static var isWatching: Bool  {
        get {
            return NetEyeProtocol.delegates.count > 0
        }
    }
    
    open class func add(observer:NetworkEyeDelegate) {
        if NetEyeProtocol.delegates.count == 0 {
            NetEyeProtocol.open()
            URLSession.open()
        }
        NetEyeProtocol.add(delegate: observer)
    }
    
    open class func remove(observer:NetworkEyeDelegate) {
        NetEyeProtocol.remove(delegate: observer)
        if NetEyeProtocol.delegates.count == 0 {
            NetEyeProtocol.close()
            URLSession.close()
        }
    }
    
}
