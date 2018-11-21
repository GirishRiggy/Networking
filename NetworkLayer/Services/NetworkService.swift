//
//  NetworkService.swift
//  NetworkLayer
//
//  Created by iCode on 21/11/18.
//  Copyright © 2018 icode. All rights reserved.
//

import Foundation

class NetworkService {
    
    public func initRequest() {
        let networkManager = NetworkManager()
        let endPointURL = "https://api.github.com/gists"
        
        networkManager.callAPI(url: endPointURL, methodType: .POST, bodyParams: nil, networkCompletionHandler: { (data, response, error) in
        
        if error != nil {
        print(Failure.NetworkFailure)
        }
        
        if data != nil {
        }
        })
    }
}
