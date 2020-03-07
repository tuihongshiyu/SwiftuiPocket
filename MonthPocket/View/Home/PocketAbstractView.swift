//
//  AbstractView.swift
//  MonthPocket
//
//  Created by 潘仲豪 on 2020/2/25.
//  Copyright © 2020 DarylPan. All rights reserved.
//

import SwiftUI

struct AbstractView: View {
    var pocket: Pocket
    var body: some View{
        VStack {
            Text(self.pocket.dateString)
            HStack {
                VStack (){
                    SingleRectView(name: "现金", value: self.pocket.moneyPlusTotal)
                    SingleRectView(name: "应还", value: self.pocket.moneyMinusTotal)
                }
                Spacer()
                SingleRectView(name: "总和", value: self.pocket.moneyTotal)
                
            }
            #if DEBUG
            Text(self.pocket.id.uuidString.suffix(8))
            #endif
        }
        .padding()
        .background(Color.white)
        .animation(.default)
        
    }
}

struct SingleRectView: View {
    var name: String
    var value: Int
    var body: some View {
        HStack {
            Text(name)
            Text(String(value))
        }
        .frame(width: 120, height: 60)
    }
}

struct AbstractView_Previews: PreviewProvider {
    struct  AbstractView_PreviewsHolder: View{
        @State var pocket = Pocket()
        var body: some View {
            AbstractView(
                pocket: self.pocket
            )
        }
    }
    static var previews: some View {
        AbstractView_PreviewsHolder()
    }
}
