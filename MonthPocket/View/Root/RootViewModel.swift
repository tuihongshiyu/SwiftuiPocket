//
//  RootViewModel.swift
//  MonthPocket
//
//  Created by 潘仲豪 on 2020/2/24.
//  Copyright © 2020 DarylPan. All rights reserved.
//
import Combine
import SwiftUI

class RootViewModel: ObservableObject {
    /// 标签栏选中的索引
    @Published var tabSelection: Int = 1
    
    /// 标签栏界面导航是否隐藏
    @Published var tabNavigationHidden: Bool = false
    
    /// 标签栏界面导航标题
    @Published var tabNavigationTitle: LocalizedStringKey = ""
    
    /// 标签栏界面导航右侧按钮
    @Published var tabNavigationBarTrailingItems: AnyView = .init(EmptyView())
    
}
