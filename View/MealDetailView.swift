//
//  MealDetailView.swift
//  Whats Next
//
//  Created by Henning Witzel on 10.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct MealDetailView: View {
   
    var meal: Meal
    
    var body: some View {

        ScrollView
        {
            VStack (alignment: .leading)
            {
                ImageViewWidget(url: meal.image_url)
                
                Text(meal.name)
                    .font(.title)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 4)
                                
                Text("Cooked " + meal.last_time_cooked)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                
                Text(meal.description)
                    .font(.body)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                        
                VStack(alignment: .leading)
                {
                    VStack(alignment: .leading)
                    {
                        Text("Created")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text(meal.created_at)
                            .font(.system(size: 16))
                            .padding(.bottom, 16)
                    }
                    VStack(alignment: .leading)
                    {
                       Text("Type of Meal")
                           .font(.system(size: 14))
                           .foregroundColor(.gray)
                       Text(meal.meal_type)
                           .font(.system(size: 16))
                           .padding(.bottom, 16)
                    }
                    
                    VStack(alignment: .leading)
                    {
                        Text("Category")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text(meal.category)
                            .font(.system(size: 16))
                            .padding(.bottom, 16)
                    }
                    
                    VStack(alignment: .leading)
                    {
                        Text("Level of Effort")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text(meal.level_of_effort + "/5")
                            .font(.system(size: 16))
                            .padding(.bottom, 16)
                    }
                    
                    VStack(alignment: .leading)
                    {
                        Text("Author")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text(meal.created_by)
                            .font(.system(size: 16))
                            .padding(.bottom, 16)
                    }
                    
                    VStack(alignment: .leading)
                    {
                        Text("Cooked")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text(meal.how_many_times_cooked + " times")
                            .font(.system(size: 16))
                            .padding(.bottom, 16)
                    }
                    
                }.padding()
                      
                Spacer()
            }
        }.navigationBarTitle(Text(meal.name), displayMode: .inline)
    }
}

