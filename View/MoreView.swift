//
//  MoreView.swift
//  Whatx Next App
//
//  Created by Henning Witzel on 16.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct MoreView: View {
    var body: some View {                
        
        NavigationView
        {
            List {
                Section(header: Text("Developer Menu")) {
                    NavigationLink(destination: FormTestView())
                    {
                        Text("Forms")
                    }
                    NavigationLink(destination: AboutView())
                    {
                        Text("Settings")
                    }
                }

                Section() {
                    NavigationLink(destination: AboutView())
                    {
                        Text("About the App")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("More"), displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button(
                        action: { print("Going to Setting") },
                        label: { Text("Logout") }
                    )
            )
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
