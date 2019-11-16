//
//  CategoriesView.swift
//  Whats Next
//
//  Created by Henning Witzel on 13.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct CategoriesView: View {
    init(){
        UINavigationBar.appearance().backgroundColor = .green
        //For other NavigationBar changes, look here:(https://stackoverflow.com/a/57509555/5623035)
    }

    var body: some View {
        ZStack {
            Color.yellow
            NavigationView {
                ZStack {
                    Color.blue
                    ScrollView
                        {
                            Text("Some text")
                    }
                }
            }.background(Color.red)
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
