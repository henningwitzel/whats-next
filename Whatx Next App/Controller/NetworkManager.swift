//
//  NetworkManager.swift
//  Whats Next
//
//  Created by Henning Witzel on 10.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    
    @Published var meals:[Meal] = [Meal]()
        
    func getAllMeals() {
        //guard let url = URL(string: "https://api.myjson.com/bins/6f9k4") else { return }
        guard let url = URL(string: "https://api.myjson.com/bins/u6fwq") else { return }
        
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