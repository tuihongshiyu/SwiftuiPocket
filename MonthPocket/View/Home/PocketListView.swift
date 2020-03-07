//
//  HomeView.swift
//  MonthPocket
//
//  Created by 潘仲豪 on 2020/2/25.
//  Copyright © 2020 DarylPan. All rights reserved.
//

import SwiftUI

struct PocketListView: View {
    @EnvironmentObject var model: RootViewModel
    @EnvironmentObject var pockets: PocketList
    init() {
        // To remove only extra separators below the list:
        //        UITableView.appearance().tableFooterView = UIView()
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        List {
            ForEach(self.pockets.pocketList.indices,id: \.self){index in
                NavigationLink(destination: PocketEditView(pocket:self.$pockets.pocketList[index])){
                    AbstractView(pocket: self.pockets.pocketList[index])
                }
            }.onDelete{pocketIndex in
                self.pockets.pocketList.remove(at: pocketIndex.first!)
            }
        }
        .onAppear {
            self.model.tabNavigationHidden = false
            self.model.tabNavigationTitle = "账单"
            self.model.tabNavigationBarTrailingItems = (.init(HomePlusButtonView().environmentObject(self.pockets)))
        }
        
    }
}

struct HomePlusButtonView:View {
    @EnvironmentObject var pockets: PocketList
    var body: some View{
        Image(systemName: "plus")
            .onTapGesture {
                print("plusButton")
                self.pockets.newPocket(newPocket: Pocket())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    struct  HomeView_Previews_Holder: View{
        var body: some View {
            PocketListView()
        }
    }
    static var previews: some View {
        HomeView_Previews_Holder()
            .environmentObject(RootViewModel())
            .environmentObject(PocketList())
    }
}
