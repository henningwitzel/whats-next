//
//  MealRowView.swift
//  Whats Next
//
//  Created by Henning Witzel on 10.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct MealRowView: View {

    var meal: Meal
    
    var body: some View{
       
        HStack
        {
            ImageRowViewWidget(url: meal.image_url)
                .padding(8)
                .padding(.leading, -8)
            
            VStack(alignment: .leading)
            {
                Text(meal.name)
                    .font(.system(size: 18))
                    .bold()
                    .padding(.bottom, 4)
                
                Text("Cooked " + meal.last_time_cooked)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
    }
}

