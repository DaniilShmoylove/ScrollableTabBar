//
//  BarItemView.swift
//  ScrollableTabBar
//
//  Created by Daniil Shmoylove on 18.03.2022.
//

import SwiftUI

struct BarItemView: View {
    
    
    //MARK: - State
    
    @Binding var currentTab: Int
    
    let namespace: Namespace.ID
    let barItemName: String
    let tab: Int
    
    var body: some View {
        Button {
            
            //MARK: - Move to current tab 
            
            self.currentTab = tab
        } label: {
            
            //MARK: - Button label
            
            VStack {
                Text(self.barItemName)
                    .foregroundColor(Color.primary)
                    .font(
                        .system(
                            size: 16,
                            weight: .medium,
                            design: .default
                        )
                    )
                
                if currentTab == tab {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.primary)
                        .frame(height: 4)
                        .matchedGeometryEffect(
                            id: "underline",
                            in: self.namespace,
                            properties: .frame
                        )
                } else {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 4)
                }
            }
            .padding(8)
        }
        .animation(.spring(), value: self.currentTab)
    }
}
