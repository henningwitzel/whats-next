//
//  AboutView.swift
//  Whatx Next App
//
//  Created by Henning Witzel on 16.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
           List {
            Section(){
                VStack(alignment: .leading){
                    Text("Why This App?")
                    .font(.title)
                    .bold()
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                    
                    Text("This app is a joint project between Firuze and Henning. Our goal is to solve an issue we have several times a week: What do we eat?")
                        .font(.body)
                    .padding(.bottom, 8)
                    
                    Text("We came up with the idea to collect all our meals that we cooked or want to cook in an app. When ever we ask ourselves the question during the week we can ask the app to suggest us something.")
                    .font(.body)
                    .padding(.bottom, 16)
                }
                
            }
            Section(footer: Text("Copyright © 2019. All Rights Reserved.")){
                HStack{
                    Text("App Version")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text("0.1.3")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                HStack{
                    
                 Text("Last Time Updated")
                    .font(.subheadline)
                 
                 Spacer()
                    
                 Text("November 16th, 2019")
                     .font(.subheadline)
                     .foregroundColor(.secondary)
                }
                HStack{
                    
                 Text("Author(s)")
                    .font(.subheadline)
                 
                 Spacer()
                    
                 Text("Firuze Acikgöz, Henning Witzel")
                     .font(.subheadline)
                     .foregroundColor(.secondary)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(Text("About The App"), displayMode: .inline)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
