//
//  MoviesListView.swift
//  Whats Next
//
//  Created by Henning Witzel on 13.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct MoviesListView: View {
    var body: some View {
                VStack{
                Image(systemName: "video")
                    .resizable()
                    .frame(width: 55, height: 40)
                    .padding(8)
                    .foregroundColor(.gray)
                Text("Movies")
                    .font(.title)
                    .padding(8)
                    .foregroundColor(.gray)
                Text("No movies added yet.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }


struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}
