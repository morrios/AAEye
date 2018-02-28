//
//  NetEyeProtocol.swift
//  merchant
//
//  Created by beequick on 2018/1/24.
//  Copyright © 2018年 beequick. All rights reserved.
//

import Foundation

class NetEyeProtocol: URLProtocol {
    
    open class func add(delegate:NetworkEyeDelegate) {
        // delete null week delegate
        self.delegates = self.delegates.filter {
            return $0.delegate != nil
        }
        
        // judge if contains the delegate from parameter
        let contains = self.delegates.contains {
            return $0.delegate?.hash == delegate.hash
        }
        // if not contains, append it with weak wrapped
        if contains == false {
            let week = WeakNetworkEyeDelegate(delegate: delegate)
            
            self.delegates.append(week)
        }
    }
    
    open class func remove(delegate:NetworkEyeDelegate) {
        self.delegates = self.delegates.filter {
            // filter null weak delegate
            return $0.delegate != nil
            }.filter {
                // filter the delegate from parameter
                return $0.delegate?.hash != delegate.hash
        }
    }
    
    static let NetEyeProtocolKey = "NetEyeProtocolKey"
    
    fileprivate var connection: NSURLConnection?
    fileprivate var ne_reponse: URLResponse?
    fileprivate var ne_data: Data?
    private(set) static  var delegates = [WeakNetworkEyeDelegate]()

    class func open() {
        URLProtocol.registerClass(self.classForCoder())
        URLSession.open()
//        if AAURLSessionConfiguration.defaultConfiguration.isSwizzle {
//            AAURLSessionConfiguration.defaultConfiguration.load()
//        }
    }
    
    class func close() {
        URLProtocol.unregisterClass(self.classForCoder())
        URLSession.close()
    }
}

extension NetEyeProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        guard let schem = request.url?.scheme else {
            return false
        }
        guard schem == "http" || schem == "https" else {
            return false
        }
        guard URLProtocol.property(forKey: NetEyeProtocolKey, in: request) == nil else {
            return false
        }
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest{
        let req = (request as NSURLRequest).mutableCopy() as! NSMutableURLRequest
        URLProtocol.setProperty(true, forKey: NetEyeProtocolKey, in: req)
        return req.copy() as! URLRequest
    }

    override func startLoading() {
        let request = NetEyeProtocol.canonicalRequest(for: self.request)
        print("Request # \(String(describing: request.url?.absoluteString))")
        connection = NSURLConnection(request: request, delegate: self, startImmediately: true)
    }
    override func stopLoading() {
        self.connection?.cancel()
        for element in NetEyeProtocol.delegates {
            element.delegate?.networkEyeDidCatch(with: request, response: self.ne_reponse, data: self.ne_data)
        }
        guard let newdata = self.ne_data else {
           return
        }
        let str = String(data: newdata, encoding: String.Encoding.utf8)
        print("Response # \(String(describing: str))")

    }
}

extension NetEyeProtocol: NSURLConnectionDelegate{
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        self.client?.urlProtocol(self, didFailWithError: error)
    }
    
    func connectionShouldUseCredentialStorage(_ connection: NSURLConnection) -> Bool {
        return true
    }
    
    func connection(_ connection: NSURLConnection, didReceive challenge: URLAuthenticationChallenge) {
        self.client?.urlProtocol(self, didReceive: challenge)
    }
    
    func connection(_ connection: NSURLConnection, didCancel challenge: URLAuthenticationChallenge) {
        self.client?.urlProtocol(self, didCancel: challenge)
    }
}


extension NetEyeProtocol: NSURLConnectionDataDelegate {
    func connection(_ connection: NSURLConnection, willSend request: URLRequest, redirectResponse response: URLResponse?) -> URLRequest? {
        if response != nil {
            self.ne_reponse = response
            self.client?.urlProtocol(self, wasRedirectedTo: request, redirectResponse: response!)
        }
        return request
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: URLCache.StoragePolicy.allowed)
        self.ne_reponse = response
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        self.client?.urlProtocol(self, didLoad: data)
        if self.ne_data == nil {
            self.ne_data = data
        }else {
            self.ne_data!.append(data)
        }
    }
    
    func connection(_ connection: NSURLConnection, willCacheResponse cachedResponse: CachedURLResponse) -> CachedURLResponse? {
        return cachedResponse
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        self.client?.urlProtocolDidFinishLoading(self)
    }
}




