//
//  NetworkCompletion.swift
//  NetworkLayer
//
//  Created by Girish K T on 16/11/18.
//  Copyright © 2018 icode. All rights reserved.
//

import Foundation

public typealias NetworkCompletion =
    (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()
