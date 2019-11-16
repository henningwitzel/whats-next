//
//  CardView.swift
//  Whats Next
//
//  Created by Henning Witzel on 13.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct CardView: View {

    var image: String
    var category: String
    var heading: String
    var counter: String

    var body: some View {
         
      VStack {
          Image(image)
             .renderingMode(.original)
            .resizable()
              .aspectRatio(contentMode: .fit)
           
       
          HStack {
              VStack(alignment: .leading) {
                  Text(category)
                    .bold()
                    .foregroundColor(.secondary)
                    .padding(.top, -10)
                    .font(.system(size: 14))
                  Text(heading)
                      .font(.title)
                      .fontWeight(.black)
                      .foregroundColor(.primary)
                      .lineLimit(3)
                  Text(counter.uppercased())
                      .font(.caption)
                      .foregroundColor(.secondary)
              }
              .layoutPriority(100)
       
              Spacer()
          }
          .padding()
      }
              .cornerRadius(10)
              .overlay(
                  RoundedRectangle(cornerRadius: 10)
                      .stroke(Color(.sRGB, red: 110/255, green: 110/255, blue: 110/255, opacity: 0.1), lineWidth: 1)
              )
              .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "swiftui-button", category: "Category", heading: "Meals", counter: "10 Meals")
    }
}
