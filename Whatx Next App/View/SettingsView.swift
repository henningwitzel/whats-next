//
//  SettingsView.swift
//  Whatx Next App
//
//  Created by Henning Witzel on 16.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var networkManagerProducts: NetworkManagerProducts = NetworkManagerProducts()
    
    var body: some View {
            
        List(networkManagerProducts.products, id:\.name){ product in
            HStack
                {
            VStack(alignment: .leading){
                Text(product.name)
                    .bold()
                Text(product.description)
                .foregroundColor(.secondary)
                }
            Spacer()
            Text("$" + product.price)
            }.padding(.bottom, 8)
            .padding(.top, 8)
            
        }
        }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
