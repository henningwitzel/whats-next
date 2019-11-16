//
//  MealListView.swift
//  Whats Next
//
//  Created by Henning Witzel on 13.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct MealListView: View {
    
    @ObservedObject var networkManager: NetworkManager = NetworkManager()
    
    var body: some View {
        List(networkManager.meals, id:\.name){ meal in
            NavigationLink(destination: MealDetailView(meal: meal)){
                           MealRowView(meal: meal)
            }
        }.navigationBarTitle(Text("My Meals"), displayMode: .inline)
    }
}
/*
struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
*/
