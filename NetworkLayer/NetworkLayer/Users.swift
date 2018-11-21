//
//  User.swift
//  NetworkLayer
//
//  Created by Girish K T on 16/11/18.
//  Copyright © 2018 icode. All rights reserved.
//

import Foundation

class Users : NSObject {
    
    @objc var name : String?
    
    init(jsonData: Data) {
        super.init()
        
        do {
            let jsonDictionary = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
            self.setValuesForKeys(jsonDictionary)
        }catch {
            print(Failure.JSONSerilaizationError)
        }
    }
}
