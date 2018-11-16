//
//  User.swift
//  NetworkLayer
//
//  Created by Girish K T on 16/11/18.
//  Copyright © 2018 icode. All rights reserved.
//

import Foundation

class User : NSObject {
    
    var userId : Int?
    var id : Int?
    var title : String?
    var completed : Bool?
    
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
