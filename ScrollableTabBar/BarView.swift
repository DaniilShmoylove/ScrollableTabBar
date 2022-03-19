//
//  BarView.swift
//  ScrollableTabBar
//
//  Created by Daniil Shmoylove on 18.03.2022.
//

import SwiftUI

public struct BarView: View {
    
    @Binding public var currentTab: Int
    
    @Namespace private var namespace
    
    public var tabBarContent: [String]
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(
                    Array(
                        zip(
                            self.tabBarContent.indices,
                            self.tabBarContent
                        )
                    ),
                    id: \.0
                ) { index, name in
                    BarItemView(
                        currentTab: self.$currentTab,
                        namespace: self.namespace.self,
                        barItemName: name,
                        tab: index
                    )
                }
            }
        }
        .background(Color(UIColor.systemBackground))
        .frame(height: 86)
    }
}
