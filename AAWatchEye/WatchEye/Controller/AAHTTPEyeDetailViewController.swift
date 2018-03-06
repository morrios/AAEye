//
//  AAHTTPEyeDetailViewController.swift
//  merchant
//
//  Created by beequick on 2018/2/11.
//  Copyright © 2018年 beequick. All rights reserved.
//

import UIKit

class AAHTTPEyeDetailViewController: AAEyeBaseViewController {
    var model = NEHTTPModel()
    var mainTextView = UITextView()
    var bottomView = UIView()

    func initBottomView() {
        let height = CGFloat(44)
        bottomView = UIView(frame: CGRect(x: 0, y: self.view.height-height, width: self.view.width, height: height))
        self.view.addSubview(bottomView)

        let titles = ["复制URL","复制body","复制json"]
        let btnWidth = self.view.width/CGFloat(titles.count)
        
        for index in 0..<titles.count {
            let frame = CGRect(x: btnWidth*CGFloat(index), y: 0, width: btnWidth, height: height)
            let btn = UIButton(type: .custom)
            btn.frame = frame
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            btn.setTitle(titles[index], for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor = UIColor(red: 0.24, green: 0.51, blue: 0.78, alpha: 1.00)
            btn.addTarget(self, action: #selector(copyAction(sender:)), for: .touchUpInside)
            btn.tag = 246+index
            bottomView.addSubview(btn)
            if index != (titles.count-1){
                let line = CALayer()
                line.frame = CGRect(x: (btnWidth-1), y: 0, width: 1, height: height)
                line.backgroundColor = UIColor.white.cgColor
                btn.layer.addSublayer(line)
            }
        }
    }
    
    func copyAction(sender:UIButton) {
        let index = sender.tag-246
        switch index {
        case 0:
            copyURL()
        case 1:
            copyBody()
        case 2:
            copyReceiveJSON()
        default:
            break
        }
    }
    
    func copyURL() {//model.requestURLString
        pasteToBoard(string: model.requestURLString)
    }
    func copyBody() {//model.requestHTTPBody
        pasteToBoard(string: model.requestHTTPBody!)
    }
    func copyReceiveJSON() {//self.replaceUnicode(aUnicodeString: model.receiveJSONData
        let s = self.replaceUnicode(aUnicodeString: model.receiveJSONData)
        pasteToBoard(string: s)
    }
    
    func pasteToBoard(string:String) {
        print(string)
        if string.count > 0 {
            let pasteboard = UIPasteboard.general
            pasteboard.string = string
        }
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        let frame = CGRect(x: 0, y: ADNavBarHeight, width: self.view.width, height: self.view.height-ADNavBarHeight-49)
        mainTextView = UITextView(frame: frame)
        self.view.addSubview(mainTextView)
        
        initBottomView()
        
        mainTextView.isEditable = false
        if #available(iOS 11, *) {
            mainTextView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
    
        
        var startDateString = NSAttributedString()
        var endDateString = NSAttributedString()
        var requestURLString = NSAttributedString()
        var requestCachePolicyString = NSAttributedString()
        var requestTimeoutInterval = NSAttributedString()
        var requestHTTPMethod = NSAttributedString()
        var requestAllHTTPHeaderFields = NSAttributedString()
        var requestHTTPBody = NSAttributedString()
        var responseMIMEType = NSAttributedString()
        var responseExpectedContentLength = NSAttributedString()
        var responseTextEncodingName = NSAttributedString()
        var responseSuggestedFilename = NSAttributedString()
        var responseStatusCode = NSAttributedString()
        var responseAllHeaderFields = NSAttributedString()
        var receiveJSONData = NSAttributedString()
        
        var startDateStringDetail = NSAttributedString()
        var endDateStringDetail = NSAttributedString()
        var requestURLStringDetail = NSAttributedString()
        var requestCachePolicyStringDetail = NSAttributedString()
        var requestTimeoutIntervalDetail = NSAttributedString()
        var requestHTTPMethodDetail = NSAttributedString()
        var requestAllHTTPHeaderFieldsDetail = NSAttributedString()
        var requestHTTPBodyDetail = NSAttributedString()
        var responseMIMETypeDetail = NSAttributedString()
        var responseExpectedContentLengthDetail = NSAttributedString()
        var responseTextEncodingNameDetail = NSAttributedString()
        var responseSuggestedFilenameDetail = NSAttributedString()
        var responseStatusCodeDetail = NSAttributedString()
        var responseAllHeaderFieldsDetail = NSAttributedString()
        var receiveJSONDataDetail = NSAttributedString()
        
        let titleColor = UIColor(red: 0.24, green: 0.51, blue: 0.78, alpha: 1.00)
        let titleFont = UIFont.systemFont(ofSize: 14)
        let detailColor = UIColor.black
        let detailFont = UIFont.systemFont(ofSize: 14)
        
        startDateString = NSMutableAttributedString(string: "[startDate]:", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        endDateString = NSMutableAttributedString(string: "[endDate]:", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        requestURLString = NSMutableAttributedString(string: "[requestURL]\n", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        requestCachePolicyString = NSMutableAttributedString(string: "[requestCachePolicy]\n", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        requestTimeoutInterval = NSMutableAttributedString(string: "[requestTimeoutInterval]:", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        requestHTTPMethod = NSMutableAttributedString(string: "[requestHTTPMethod]:", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        requestAllHTTPHeaderFields = NSMutableAttributedString(string: "[requestAllHTTPHeaderFields]\n", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        requestHTTPBody = NSMutableAttributedString(string: "[requestHTTPBody]\n", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        responseMIMEType = NSMutableAttributedString(string: "[responseMIMEType]:", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        responseExpectedContentLength = NSMutableAttributedString(string: "[responseExpectedContentLength]:", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        responseTextEncodingName = NSMutableAttributedString(string: "[responseTextEncodingName]:", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        responseSuggestedFilename = NSMutableAttributedString(string: "[responseSuggestedFilename]:", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        responseStatusCode = NSMutableAttributedString(string: "[responseStatusCode]:", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        responseAllHeaderFields = NSMutableAttributedString(string: "[responseAllHeaderFields]\n", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])
        receiveJSONData = NSMutableAttributedString(string: "[receiveData]\n", attributes: [NSFontAttributeName: titleFont,NSForegroundColorAttributeName: titleColor])

        
        //detail
        startDateStringDetail = NSMutableAttributedString(string: "\(model.startDateString)\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        endDateStringDetail = NSMutableAttributedString(string: "\(model.endDateString)\n\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        requestURLStringDetail = NSMutableAttributedString(string: "\(model.requestURLString)\n\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        requestCachePolicyStringDetail = NSMutableAttributedString(string: "\(model.requestCachePolicy)\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        requestTimeoutIntervalDetail = NSMutableAttributedString(string: "\(model.requestTimeoutInterval)\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        requestHTTPMethodDetail = NSMutableAttributedString(string: "\(String(describing: model.requestHTTPMethod!))\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        requestAllHTTPHeaderFieldsDetail = NSMutableAttributedString(string: "\(String(describing: model.requestAllHTTPHeaderFields!))\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        requestHTTPBodyDetail = NSMutableAttributedString(string: "\(String(describing: model.requestHTTPBody!))\n\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        responseMIMETypeDetail = NSMutableAttributedString(string: "\(String(describing: model.responseMIMEType!))\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        responseExpectedContentLengthDetail = NSMutableAttributedString(string: "\(Double(model.responseExpectedContentLength)!/1024.0)KB\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        responseTextEncodingNameDetail = NSMutableAttributedString(string: "\(String(describing: model.responseTextEncodingName!))\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        responseSuggestedFilenameDetail = NSMutableAttributedString(string: "\(String(describing: model.responseSuggestedFilename!))\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])


        var statusDetailColor = UIColor(red: 0.96, green: 0.15, blue: 0.11, alpha: 1)
        if (model.responseStatusCode == 200) {
            statusDetailColor = UIColor(red: 0.11, green: 0.76, blue: 0.13, alpha: 1)
        }
        responseStatusCodeDetail = NSMutableAttributedString(string: "\(model.responseStatusCode)\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: statusDetailColor])
        responseAllHeaderFieldsDetail = NSMutableAttributedString(string: "\(String(describing: model.responseAllHeaderFields!))\n\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        receiveJSONDataDetail = NSMutableAttributedString(string: "\(self.replaceUnicode(aUnicodeString: model.receiveJSONData))\n\n", attributes: [NSFontAttributeName: detailFont,NSForegroundColorAttributeName: detailColor])
        let attrText = NSMutableAttributedString()
        
        attrText.append(startDateString)
        attrText.append(startDateStringDetail)
        
        attrText.append(endDateString)
        attrText.append(endDateStringDetail)
        
        attrText.append(requestURLString)
        attrText.append(requestURLStringDetail)
        
        attrText.append(requestCachePolicyString)
        attrText.append(requestCachePolicyStringDetail)
        
        attrText.append(requestTimeoutInterval)
        attrText.append(requestTimeoutIntervalDetail)
        
        attrText.append(requestHTTPMethod)
        attrText.append(requestHTTPMethodDetail)
        
        attrText.append(requestAllHTTPHeaderFields)
        attrText.append(requestAllHTTPHeaderFieldsDetail)
        
        attrText.append(requestHTTPBody)
        attrText.append(requestHTTPBodyDetail)
        
        attrText.append(responseMIMEType)
        attrText.append(responseMIMETypeDetail)
        
        attrText.append(responseExpectedContentLength)
        attrText.append(responseExpectedContentLengthDetail)
        
        attrText.append(responseTextEncodingName)
        attrText.append(responseTextEncodingNameDetail)
        
        attrText.append(responseSuggestedFilename)
        attrText.append(responseSuggestedFilenameDetail)
        
        attrText.append(responseStatusCode)
        attrText.append(responseStatusCodeDetail)
        
        attrText.append(responseAllHeaderFields)
        attrText.append(responseAllHeaderFieldsDetail)
        
        attrText.append(receiveJSONData)
        attrText.append(receiveJSONDataDetail)

        mainTextView.attributedText = attrText
        
    }
    func replaceUnicode(aUnicodeString: String) -> String {

        
        return aUnicodeString

    }


}
