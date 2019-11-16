//
//  Meal.swift
//  Whats Next
//
//  Created by Henning Witzel on 10.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import Foundation

struct Meal: Decodable{
    let id: Int
    let name: String
    let image_url: String
    let description: String
    let created_at: String
    let last_time_cooked: String
    let how_many_times_cooked: String
    let meal_type: String
    let category: String
    let level_of_effort: String
    let created_by: String
}
