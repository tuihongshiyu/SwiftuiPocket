//
//  PocketEditView.swift
//  MonthPocket
//
//  Created by 潘仲豪 on 2020/3/3.
//  Copyright © 2020 DarylPan. All rights reserved.
//

import SwiftUI

struct PocketEditView: View {
    @Binding var pocket: Pocket
    var body: some View {
        VStack {
            List {
                ForEach(self.pocket.accountList.indices, id: \.self) { index in
                    NavigationLink(destination: AccountEditView(accout:self.$pocket.accountList[index],pocket:self.$pocket)){
                        HStack {
                            Image(systemName: "app.fill")
                                .foregroundColor(self.pocket.accountList[index].value < 0 ? .red : .blue)
                            Text(self.pocket.accountList[index].name)
                            Spacer()
                            Text(String(self.pocket.accountList[index].value))
                        }
                    }
                    
                }
                .onDelete { accountIndex in
                    print("delete \(self.pocket.accountList.count)")
                    self.pocket.accountList.remove(at: accountIndex.first!)
                }
            }
            Image(systemName: "plus")
                .onTapGesture {
                    self.pocket.setAccout(id: UUID(), name: "NewAccount", value: 0)
            }
        }
        .onAppear{
            self.pocket.updateAccoutView()
        }
    }
}

struct PocketEditView_Previews: PreviewProvider {
    struct  PocketEditView_PreviewsHolder: View{
        @State var pocket = Pocket()
        var body: some View {
            
            NavigationView {
                PocketEditView(
                    pocket: self.$pocket
                )
            }
            
        }
    }
    static var previews: some View {
        PocketEditView_PreviewsHolder()
    }
}
