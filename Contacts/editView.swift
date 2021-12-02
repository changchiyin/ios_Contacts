//
//  addView.swift
//  Contacts
//
//  Created by User10 on 2021/11/27.
//

import SwiftUI

struct editView: View {
    @Binding var inf_list: [Information]
    @Binding var inf: Information
    @Binding var show: Bool
    @State private var showingAlert: Bool = false
    let genders = ["男性", "女性", "中性"]
    var body: some View {
        VStack{
            Form{
                Section(header: HStack{
                    Button("刪除") {
                        inf_list.remove(at: index(for: inf))
                        show = false
                    }
                    .foregroundColor(.red)
                    Spacer()
                    Button("儲存") {
                        if(inf.name.isEmpty){
                            showingAlert = true
                        }
                        else{
                            show = false
                        }
                    }
                }) {
                    InformationView(inf: $inf)
                }
            }
        }.alert(isPresented: $showingAlert) { Alert(title: Text("請輸入姓名！"))}
    }
    private func index(for inf: Information) -> Int {
            guard let infIndex = inf_list.firstIndex(where: { $0.id == inf.id }) else {
                fatalError("Can't find information in array")
            }
            return infIndex
    }
}

struct editView_Previews: PreviewProvider {
    @State static var inf_list:[Information] = []
    @State static var inf:Information = Information(name: "", phone: "", mail: "", birth: Date(), gender:"男性", height: 160.5, color: .white, tabletennis: false, introduction: "")
    @State static var show:Bool = true
    static var previews: some View {
        editView(inf_list:$inf_list, inf: $inf, show: $show)
    }
}
