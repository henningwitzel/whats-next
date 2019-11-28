//
//  ModalView.swift
//  Whatx Next App
//
//  Created by Henning Witzel on 27.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    
    @Binding var showModal: Bool
    
    var body: some View {
         VStack {
               // 2.
               Button("Dismiss") {
                   self.showModal.toggle()
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
         ModalView(showModal: .constant(true))
    }
}
