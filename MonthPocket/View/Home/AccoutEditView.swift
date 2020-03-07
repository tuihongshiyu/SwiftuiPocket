//
//  AccoutEditView.swift
//  MonthPocket
//
//  Created by 潘仲豪 on 2020/3/7.
//  Copyright © 2020 DarylPan. All rights reserved.
//

import SwiftUI

struct AccountEditView: View {
    @Binding var accout:Accout
    @Binding var pocket:Pocket
    @EnvironmentObject var model: RootViewModel
    
    var body: some View{
        List{
            HStack{
                Text("账户")
                    .padding()
                TextField("账户",text: self.$accout.name)
                    .background(Color("background"))
                    .padding()
            }
            HStack {
                Text("金额")
                    .padding()
                TextField("金额",value: self.$accout.value, formatter: NumberFormatter())
                    
                    .background(Color("background"))
                    .padding()
            }
        }
        .onDisappear{
            self.pocket.updateAccoutView()
        }
    }
}

struct accountSaveButton {
    var body: some View{
        Text("Save")
    }
}
