//
//  ViewController.swift
//  NetworkLayer
//
//  Created by Girish K T on 14/11/18.
//  Copyright © 2018 icode. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        doDBOperation()
    }
    
    func doDBOperation() {
        let dataHandler = DataHandler()
        dataHandler.insertData()
        dataHandler.updateData()
        dataHandler.deleteData()
        dataHandler.fetchData()
    }
    
    func handleDataFromAPI() {
        let service = NetworkService()
        service.initRequest()
    }
    
}

