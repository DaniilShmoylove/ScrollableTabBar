//
//  ScrollableTabBarView.swift
//  ScrollableTabBar
//
//  Created by Daniil Shmoylove on 18.03.2022.
//

import SwiftUI

struct ScrollableTabBarView: View {
    
    //MARK: - State
    
    @State private var currentTab = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            
            //MARK: - Your TabView
            
            //Your TabView with page style (indexDisplayMode: .never)
            
            TabView(selection: self.$currentTab) {
                ForEach(0..<3, id: \.self) {
                    Text("View - \($0)").tag($0)
                }
            }
            .tabViewStyle(
                .page(
                    indexDisplayMode: .never
                )
            )
            
            //MARK: - BarView
            
            //Нou need to create a structure object "BarView" and bind the @State variable to your TabView
            
            BarView(
                currentTab: self.$currentTab,
                tabBarContent: ["Profile", "Main", "Options"]
            )
        }
    }
}

#if DEBUG
struct ScrollableTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableTabBarView()
    }
}
#endif
