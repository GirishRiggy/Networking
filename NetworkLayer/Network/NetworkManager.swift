//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Girish K T on 16/11/18.
//  Copyright © 2018 icode. All rights reserved.
//

import Foundation

class NetworkManager {
    
    public func callAPI(url: String, methodType: HTTPMethodType, bodyParams: Data?, networkCompletionHandler: @escaping NetworkCompletion) {
        
        debugPrint("Current Request Method Type : \(methodType.rawValue)")
        let httpURL = URL(string: url)!
        
        switch methodType {
        case .POST:
            makePOSTRequest(httpURL: httpURL, body: bodyParams, completionHandler: networkCompletionHandler)
            
        default:
            print("Invalid Request")
        }
    }
    
    private func makePOSTRequest(httpURL: URL, body: Data?, completionHandler: @escaping NetworkCompletion) {
        
        var httpURLRequest = URLRequest(url: httpURL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60.0)
        httpURLRequest.httpMethod = HTTPMethodType.POST.rawValue
        httpURLRequest.setValue("application/json", forHTTPHeaderField:"Content-Type")
        httpURLRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        httpURLRequest.httpBody = body
        
        let httpURLSessionConfig = URLSessionConfiguration.default
        let httpURLSession = URLSession(configuration: httpURLSessionConfig)
        
        httpURLSession.dataTask(with: httpURLRequest, completionHandler: completionHandler).resume()
    }
}












