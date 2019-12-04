//
//  NetworkManager.swift
//  Whatx Next App
//
//  Created by Henning Witzel on 16.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    
    @Published var meals:[Meal] = [Meal]()
        
    func getAllMeals() {
        guard let url = URL(string: "https://whatsnext.henning-witzel.de/api/meal/read") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let meals = try JSONDecoder().decode([Meal].self, from: data!)
                DispatchQueue.main.async {
                    self.meals = meals
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
    }
    
    init() {
        getAllMeals()
    }
}
