//
//  ContentView.swift
//  Whatx Next App
//
//  Created by Henning Witzel on 16.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
   
    @State private var selection = 0
    @ObservedObject var networkManager: NetworkManager = NetworkManager()
    
    var body: some View {
        
        TabView{
            NavigationView{
            VStack{
                Image(systemName: "tray")
                    .resizable()
                    .frame(width: 55, height: 40)
                    .padding(8)
                    .foregroundColor(.gray)
                Text("Whats Next?!")
                    .font(.title)
                    .padding(8)
                    .foregroundColor(.gray)
                Text("You have nothing that comes next.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            }.navigationBarTitle(Text("Whats Next?!"))
            .tabItem {
                VStack {
                    Image(systemName: "tray")
                    Text("Whats Next?!")
                }
            }
           
            NavigationView {
                ScrollView{
                   NavigationLink(destination: MealListView(networkManager: networkManager))
                    {
                        CardView(image: "meals", category: "Category", heading: "My Meals", counter: "10 Meals")
                    }
                    
                    NavigationLink(destination: RestaurantsListView())
                    {
                        CardView(image: "restaurants", category: "Category", heading: "My Restaurants", counter: "0 Restaurants")
                    }
                   
                    NavigationLink(destination: MoviesListView())
                    {
                        CardView(image: "movies", category: "Category", heading: "My Movies", counter: "0 Movies")
                    }
                    
                    NavigationLink(destination: TVShowsListView())
                    {
                        CardView(image: "netflix", category: "Category", heading: "My TV Shows", counter: "0 Shows")
                    }
                    .padding(.bottom, 24)
                    
                    }.navigationBarTitle("Categories")
                }
            .tabItem {
               VStack {
                    Image(systemName: "rectangle.grid.1x2")
                    Text("Categories")
                }
            }
           
            MoreView()
            .tabItem {
               VStack {
                    Image(systemName: "ellipsis")
                    Text("More")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/*
 //OLD VIEW
NavigationView{
    List(networkManager.meals, id:\.name) { meal in
        NavigationLink(destination: MealDetailView(meal: meal)){
            MealRowView(meal: meal)
        }
   }.navigationBarTitle(Text("Meals"))
}
    .font(.title)
    .tabItem {
       VStack {
            Image(systemName: "list.dash")
            Text("Meals")
        }
    }
 */
