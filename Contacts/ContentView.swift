//
//  ContentView.swift
//  Contacts
//
//  Created by User10 on 2021/11/27.
//

import SwiftUI

struct Information: Identifiable {
    let id = UUID()
    var name: String
    var phone: String
    var mail: String
    var birth: Date
    var gender: String
    var height: Double
    var color: Color
    var tabletennis: Bool
    var introduction:String
}

struct ContentView: View {
    @State private var inf_list:[Information] = []
    @State private var edit: Bool = false
    @State private var add: Bool = false
    @State private var random: Bool = false
    @State private var showingAlert: Bool = false
    var body: some View {
        ZStack{
            NavigationView{
                List{
                    ForEach($inf_list){ $data in
                        Button(action:{
                            self.edit = true
                        }){
                            HStack{
                                Text(data.name)
                            }
                            .sheet(isPresented: $edit){
                                editView(inf_list: $inf_list, inf: $data, show: $edit)
                            }
                        }
                    }.onDelete(perform: delete)
                }
                .toolbar {
                    EditButton()
                }
                .navigationTitle("通訊錄")
            }
            VStack{
                Spacer()
                HStack{
                    Button(action: {
                        if(inf_list.count > 0){
                            self.random = true
                        }
                        else{
                            showingAlert = true
                        }
                    }){
                        Image("dice")
                            .resizable()
                    }
                    .padding()
                    .scaleEffect(1.25)
                    .frame(width: 75, height: 75)
                    Spacer()
                    Button(action: {
                        self.add = true
                    }){
                        Image("add")
                            .resizable()
                    }
                    .padding()
                    .scaleEffect(1.75)
                    .frame(width: 75, height: 75)
                }
            }.alert(isPresented: $showingAlert) { Alert(title: Text("沒有聯絡人！"))}
        }
        .sheet(isPresented: $random){
            showView(inf: $inf_list.randomElement()!, show: $random)
        }
        .fullScreenCover(isPresented: $add){
            addView(inf_list: $inf_list, show: $add)
        }
    }
    func delete(at offsets: IndexSet) {
        inf_list.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
