//
//  TVShowsListView.swift
//  Whats Next
//
//  Created by Henning Witzel on 13.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct TVShowsListView: View {
       var body: some View {
                VStack{
                Image(systemName: "square.stack")
                    .resizable()
                    .frame(width: 55, height: 50)
                    .padding(8)
                    .foregroundColor(.gray)
                Text("TV Shows")
                    .font(.title)
                    .padding(8)
                    .foregroundColor(.gray)
                Text("No tv shows added yet.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }


struct TVShowsListView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowsListView()
    }
}
