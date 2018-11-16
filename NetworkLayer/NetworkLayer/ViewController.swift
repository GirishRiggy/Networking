//
//  ViewController.swift
//  NetworkLayer
//
//  Created by Girish K T on 14/11/18.
//  Copyright © 2018 icode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let networkManager = NetworkManager()
        let endPointURL = "https://jsonplaceholder.typicode.com/todos/1"
        
        networkManager.callAPI(url: endPointURL, methodType: .POST, bodyParams: nil, networkCompletionHandler: { (data, response, error) in
            
            if error != nil {
                print(Failure.NetworkFailure)
            }
            
            if data != nil {
                let user = User(jsonData: data!)
                print(user)
            }
        })
    }

}

