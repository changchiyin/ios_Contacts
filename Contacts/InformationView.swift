//
//  InformationView.swift
//  Contacts
//
//  Created by User07 on 2021/12/1.
//

import SwiftUI

struct InformationView: View {
    @Binding var inf: Information
    let genders = ["男性", "女性", "中性"]
    var body: some View {
        Group{
            TextField("請輸入名字(必填)", text: $inf.name)
            TextField("請輸入電話(選填)", text: $inf.phone)
                .keyboardType(.decimalPad)
            TextField("請輸入電子郵件(選填)", text: $inf.mail)
            DatePicker("生日", selection: $inf.birth, displayedComponents: .date)
            Picker(selection: $inf.gender, label: Text("選擇性別")) {
                ForEach(genders) { gender in
                    Text(gender)
                }
            }.pickerStyle(SegmentedPickerStyle())
            Slider(value: $inf.height, in: 0...300, step: 0.1)
            Stepper("身高 \(inf.height, specifier: "%.1f") 公分", value: $inf.height, in: 0...300, step: 0.1)
            HStack{
                Spacer()
                Image("human")
                    .resizable()
                    .scaledToFit()
                    .scaledToFill()
                    .frame(width: 5, height: inf.height)
                Spacer()
            }
            ColorPicker("喜歡的顏色", selection: $inf.color)
            Toggle("有在打桌球嗎？", isOn: $inf.tabletennis)
        }
        ZStack{
            if inf.introduction.isEmpty {
                VStack{
                    HStack{
                        Text("請輸入自我介紹(選填)")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 12)
                        Spacer()
                    }
                    Spacer()
                }
            }
            TextEditor(text: $inf.introduction)
                .frame(height: 300)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    @State static var inf:Information = Information(name: "", phone: "", mail: "", birth: Date(), gender:"男性", height: 160.5, color: .white, tabletennis: false, introduction: "")
    static var previews: some View {
        VStack{
            Form{
                InformationView(inf: $inf)
            }
        }
    }
}
