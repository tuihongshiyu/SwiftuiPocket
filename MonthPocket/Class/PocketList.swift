//
//  PocketList.swift
//  MonthPocket
//
//  Created by 潘仲豪 on 2020/2/25.
//  Copyright © 2020 DarylPan. All rights reserved.
//

import SwiftUI

class PocketList: ObservableObject,Hashable {
    static func == (lhs: PocketList, rhs: PocketList) -> Bool {
        return lhs.id == rhs.id
    }
    
    @Published var id = UUID()
    @Published var pocketList = [Pocket]()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    func removePocket(removeID: UUID) {
        for i in 0...self.pocketList.count-1{
            if self.pocketList[i].id == removeID{
                self.pocketList.remove(at: i)
                return
            }
        }
    }
    
    func newPocket(newPocket: Pocket){
        self.pocketList.append(newPocket)
        self.pocketListSort()
    }
    
    func pocketListSort(){
        self.pocketList.sort{ DateStringOP().StringToDate(date: $0.dateString).timeIntervalSince1970 > DateStringOP().StringToDate(date: $1.dateString).timeIntervalSince1970}
    }
}

