//
//  showView.swift
//  Contacts
//
//  Created by ljy on 2021/12/2.
//

import SwiftUI

struct showView: View {
    @Binding var inf: Information
    @Binding var show: Bool
    var body: some View {
        VStack{
            HStack{
                Button("返回") {
                    show = false
                }
                .padding()
                Spacer()
            }
            Spacer()
            DisclosureGroup("點擊展開神秘人的資料") {
                VStack (alignment: .leading){
                    Text("姓名 : \(inf.name)")
                    Text("電話 : \(inf.phone)")
                    Text("電子郵件 : \(inf.mail)")
                    HStack{
                        Text("生日 : ")
                        Text(inf.birth, style: .date)
                    }
                    Text("性別 : \(inf.gender)")
                    Text("身高 \(inf.height, specifier: "%.1f") 公分")
                    HStack{
                        Text("喜歡的顏色 :")
                        Image(systemName: "square.fill")
                            .foregroundColor(inf.color)
                    }
                    Text("有沒有打桌球 : \(inf.tabletennis ? "有":"沒有")")
                    Text("自我介紹 :")
                    Text(inf.introduction)
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct showView_Previews: PreviewProvider {
    @State static var inf = Information(name: "Jimmy", phone: "0938475634", mail: "jimmy@mail.com", birth: Date(), gender: "男性", height: 190, color: .blue, tabletennis: true, introduction: "hi every one")
    @State static var show = false
    static var previews: some View {
        showView(inf: $inf, show: $show)
    }
}
