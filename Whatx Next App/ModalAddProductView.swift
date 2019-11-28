//
//  ModalAddProductView.swift
//  Whatx Next App
//
//  Created by Henning Witzel on 27.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI


struct ModalAddProductView: View {
    
    @State var name = ""
    @State var price = ""
    @State var description = ""
    @State var category_id = 1
    @State private var selectedDate = Date()
    @State private var submit = false
    @State private var success = false
    
    @Binding var showModal: Bool    
    
    @State var manager = HttpSend()
    
    var body: some View {
         NavigationView {
        Form {
                Section(){
                    HStack{
                        VStack(alignment: .leading){
                                Text("Name")
                                    .foregroundColor(.secondary)
                                    .font(.system(size: 12))
                                TextField("Pillow", text: $name)
                        }
                        .padding(.bottom, 8)
                        .padding(.top, 8)
                        
                        VStack(alignment: .leading){
                                Text("Price")
                                    .foregroundColor(.secondary)
                                    .font(.system(size: 12))
                                 TextField("$199", text: $price)
                        }
                        .padding(.bottom, 8)
                        .padding(.top, 8)
                    }
                    
                    VStack(alignment: .leading){
                            Text("Description")
                                .foregroundColor(.secondary)
                                .font(.system(size: 12))
                             TextField("Lorem ipsum dolor sit amet", text: $description)
                    }
                    .padding(.bottom, 8)
                    .padding(.top, 8)
                    
                    VStack(alignment: .leading){
                            Text("Select Category")
                                .foregroundColor(.secondary)
                                .font(.system(size: 12))
                        Picker(selection: $category_id, label: Text("Category"))
                        {
                            Text("Fashion").tag(1)
                            Text("Electronics").tag(2)
                            Text("Motors").tag(3)
                            Text("Movies").tag(4)
                            Text("Books").tag(5)
                            Text("Sports").tag(13)
                        }
                    }
                    .padding(.bottom, 8)
                    .padding(.top, 8)
                    
                    VStack(alignment: .leading){
                            Text("Date")
                                .foregroundColor(.secondary)
                                .font(.system(size: 12))
                              DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: .date) {Text("")}
                    }
                    .padding(.bottom, 8)
                    .padding(.top, 8)
                }
                          
                Section(){
                    Button("Save") {
                        self.manager.SendData(
                            name: self.name,
                            price: self.price,
                            description: self.description,
                            category_id: String(self.category_id),
                            created: self.selectedDate.toString(dateFormat: "yyyy-MM-dd HH:mm:ss"))
                         
                            self.showModal.toggle()
                    }
               }
            }.navigationBarTitle(Text("New Product"))
             .navigationBarItems(trailing: Button(action: { self.showModal.toggle() } ) { Text("Cancel") })
         }
    }
}
