//
//  FormTestView.swift
//  Whatx Next App
//
//  Created by Henning Witzel on 16.11.19.
//  Copyright © 2019 Henning Witzel. All rights reserved.
//

import SwiftUI

class HttpSend : ObservableObject{
    
    var dataSuccessfullySend = false

    func SendData(name: String, price: String, description: String, category_id: String, created: String )
    {
        guard let url = URL(string : "https://whatsnext.henning-witzel.de/api/product/create.php") else { return  }
        
        let body: [String: String] = ["name" : name, "price" : price, "description" : description, "category_id" : category_id, "created" :  created]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else { return }
            
            let finalData = try! JSONDecoder().decode(ServerMessage.self, from: data)
            
            if finalData.message == "Product was created."
            {
                DispatchQueue.main.async {
                    self.dataSuccessfullySend = true
                }
            }
        }.resume()
    }
}

struct ServerMessage: Decodable {
    let message: String
}


struct FormTestView: View {
    
    @State var name = ""
    @State var price = ""
    @State var description = ""
    @State var category_id = 1
    @State private var selectedDate = Date()
    @State private var submit = false
    @State private var success = false
    
    @State var manager = HttpSend()
    
    var body: some View {
            Form {
                Section(){
                    if manager.dataSuccessfullySend
                    {
                        Text("✅ Data send to server!")
                    }
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
                   Button(action: {
                    self.manager.SendData(name: self.name, price: self.price, description: self.description, category_id: String(self.category_id), created: self.selectedDate.toString(dateFormat: "yyyy-MM-dd HH:mm:ss"))
                    self.submit = true
                    }) {
                        Text("Submit")
                    }
                    .alert(isPresented: $submit) {
                        Alert(
                            title: Text("Thank You"),
                            message: Text("You've added a product!"),
                            dismissButton: .default(Text("Okay")))
                    }
               }
            }.navigationBarTitle(Text("Add a new Product"), displayMode: .inline)
    }
}

struct FormTestView_Previews: PreviewProvider {
    static var previews: some View {
        FormTestView()
    }
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
