//
//  ModalTestView.swift
//  Whatx Next App
//
//  Created by Henning Witzel on 27.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct ModalTestView: View {
    
     @State private var showModal = false
    
    var body: some View {
         Button("Show Modal") {
                 // 2.
                 self.showModal.toggle()
              // 3.
              }.sheet(isPresented: $showModal) {
                   ModalView(showModal: self.$showModal)
               }
           }    
}

struct ModalTestView_Previews: PreviewProvider {
    static var previews: some View {
        ModalTestView()
    }
}
