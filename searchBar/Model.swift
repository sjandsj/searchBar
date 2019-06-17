//
//  Model.swift
//  searchBar
//
//  Created by mac on 14/06/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import Foundation
import UIKit

class DataModel {
    var name: String
    var city: String
    
    init(yourName: String, yourCity: String) {
        self.name = yourName
        self.city = yourCity
    }
    
    init(yourName: String) {
        self.name = yourName
        self.city = ""
    }
}
