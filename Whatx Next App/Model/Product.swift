//
//  Product.swift
//  Whatx Next App
//
//  Created by Henning Witzel on 18.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import Foundation

struct Product: Decodable{
    let id: String
    let name: String
    let description: String
    let price: String
    let category_id: String
    let category_name: String
}
