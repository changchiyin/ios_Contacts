//
//  addView.swift
//  Contacts
//
//  Created by User10 on 2021/11/27.
//

import SwiftUI

extension String: Identifiable {
    public var id: String { self }
}

struct addView: View {
    
    @Binding var inf_list: [Information]
    @Binding var show: Bool
    @State private var inf = Information(name: "", phone: "", mail: "", birth: Date(), gender:"男性", height: 160.5, color: .white, tabletennis: false, introduction: "")
    @State private var showingAlert: Bool = false
    let genders = ["男性", "女性", "中性"]
    var body: some View {
        VStack{
            Form{
                Section(header: HStack{
                    Button("取消") {
                        show = false
                    }
                    Spacer()
                    Button("儲存") {
                        if(inf.name.isEmpty){
                            showingAlert = true
                        }
                        else{
                            self.inf_list.append(inf)
                            show = false
                        }
                    }
                }) {
                    InformationView(inf: $inf)
                }
            }
        }.alert(isPresented: $showingAlert) { Alert(title: Text("請輸入姓名！"))}
    }
}

struct addView_Previews: PreviewProvider {
    @State static var test:[Information] = []
    @State static var show:Bool = true
    static var previews: some View {
        addView(inf_list: $test, show: $show)
    }
}
