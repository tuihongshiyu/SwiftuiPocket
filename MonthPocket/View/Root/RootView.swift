//
//  RootView.swift
//  MonthPocket
//
//  Created by 潘仲豪 on 2020/2/24.
//  Copyright © 2020 DarylPan. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var model = RootViewModel()
    @ObservedObject var pockets = PocketList()
    var body: some View {
        NavigationView {
            TabView(selection: self.$model.tabSelection){
                ChartView()
                .tabItem {
                    Item(
                        index: $model.tabSelection,
                        style: .chart
                    )
                }.tag(0)
                
                PocketListView()
                    .tabItem {Item(index: $model.tabSelection,style: .main)}.tag(1)
                    .environmentObject(self.model)
                    .environmentObject(self.pockets)
                
                
                SettingView()
                .tabItem {
                    Item(
                        index: $model.tabSelection,
                        style: .setting
                    )
                }.tag(2)
            }
            .accentColor(.blue) // 选中某个 Tab 时，Item 的高亮颜色
            .navigationBarTitle(model.tabNavigationTitle, displayMode: .inline)
            .navigationBarItems(trailing: model.tabNavigationBarTrailingItems)
            .environmentObject(model)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    struct  RootView_Previews_Holder: View{
        var body: some View {
            RootView()
        }
    }
    static var previews: some View {
        RootView_Previews_Holder()
    }
}



