//
//  Item.swift
//  MonthPocket
//
//  Created by 潘仲豪 on 2020/3/1.
//  Copyright © 2020 DarylPan. All rights reserved.
//

import SwiftUI

struct Item: View {
    @Binding var index: Int
    
    let style: Style
    
    var body: some View {
        VStack {
            style.image
            Text(style.text)
        }
    }
}

extension Item {
    
    enum Style: Int {
        case main
        case setting
        case chart
        
        var image: Image {
            switch self {
            case .main:     return Image(systemName:"tray.full")
            case .setting:  return Image(systemName:"gear")
            case .chart:    return Image(systemName:"chart.pie")
            }
        }
        
        var text: String {
            switch self {
            case .main:     return "账单"
            case .setting:  return "设置"
            case .chart: return "统计"
            }
        }
    }
}
