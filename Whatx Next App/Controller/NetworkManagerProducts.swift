//
//  NetworkManagerProducts.swift
//  Whatx Next App
//
//  Created by Henning Witzel on 18.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import Foundation

class NetworkManagerProducts: ObservableObject {
    
    @Published var products:[Product] = [Product]()
        
    func getAllProducts() {
        guard let url = URL(string: "https://whatsnext.henning-witzel.de/test-api/product/read.php") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let products = try JSONDecoder().decode([Product].self, from: data!)
                DispatchQueue.main.async {
                    self.products = products
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
    }
    
    init() {
        getAllProducts()
    }
}
