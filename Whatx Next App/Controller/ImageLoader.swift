//
//  ImageLoader.swift
//  Whats Next
//
//  Created by Henning Witzel on 10.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ImageLoader:ObservableObject
{
    @Published var data:Data = Data()
    
    func getImage(imageURL:String) {
        guard let url = URL(string: imageURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    self.data = data
                }
            }
        }.resume()
    }
    init(imageURL:String) {
        getImage(imageURL: imageURL)
    }
}

struct ImageViewWidget:View
{
    @ObservedObject var imageLoader: ImageLoader //= ImageLoader(imageURL: self.url)
    
    init(url:String)
    {
        imageLoader = ImageLoader(imageURL: url)
    }
    var body:some View
    {
        Image(uiImage: UIImage(data: imageLoader.data) ?? UIImage())
            .resizable()            
            .frame(width: UIScreen.main.bounds.width, height: 300)
    }
}

struct ImageRowViewWidget:View
{
    @ObservedObject var imageLoader: ImageLoader //= ImageLoader(imageURL: self.url)
    
    init(url:String)
    {
        imageLoader = ImageLoader(imageURL: url)
    }
    var body:some View
    {
        Image(uiImage: UIImage(data: imageLoader.data) ?? UIImage())
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 80, height: 80)
    }
}

