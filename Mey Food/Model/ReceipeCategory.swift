//
//  ReceipeCategory.swift
//  Mey Food
//
//  Created by IndratS on 02/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import Foundation

enum ReceipeCategory {
    case complexSearch
    
    
    var chooseCategory: String {
        switch self {
        case .complexSearch:
            return "complexSearch"
       
        }
    }
    
}

