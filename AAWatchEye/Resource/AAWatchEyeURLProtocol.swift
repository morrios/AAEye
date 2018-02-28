//
//  AAWatchEyeURLProtocol.swift
//  merchant
//
//  Created by beequick on 2018/1/23.
//  Copyright © 2018年 beequick. All rights reserved.
//

import UIKit
var requestCount = 0

class AAWatchEyeURLProtocols:URLProtocol {

    var connection: NSURLConnection?
    
    override class func canInit(with request: URLRequest) -> Bool {
      
        requestCount = requestCount + 1
        print("Request #\(requestCount)\(String(describing: request.url?.absoluteString))")
        return false
    }
    
    override public func startLoading() {
        print("startLoading")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        connection = NSURLConnection(request: request, delegate: self) //Depecrated!
        
    }
    
    override public func stopLoading() {
        print("stopLoading")
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
