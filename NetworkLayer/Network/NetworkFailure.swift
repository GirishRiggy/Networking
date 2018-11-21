//
//  NetworkError.swift
//  NetworkLayer
//
//  Created by Girish K T on 16/11/18.
//  Copyright © 2018 icode. All rights reserved.
//

import Foundation

public enum Failure : String {
    case NetworkFailure = "Network Error"
    case JSONSerilaizationError = "Data Error"
    case DataBaseError = "DB error"
}
