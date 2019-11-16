//
//  RestaurantsListView.swift
//  Whats Next
//
//  Created by Henning Witzel on 13.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct RestaurantsListView: View {
    var body: some View {
        VStack{
            Image(systemName: "house")
                .resizable()
                .frame(width: 55, height: 48)
                .padding(8)
                .foregroundColor(.gray)
            Text("Restaurants")
                .font(.title)
                .padding(8)
                .foregroundColor(.gray)
            Text("No restaurants added yet.")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct RestaurantsListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsListView()
    }
}
