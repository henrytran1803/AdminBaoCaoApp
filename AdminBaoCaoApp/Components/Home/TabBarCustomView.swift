//
//  TabBarCustomView.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 25/03/2024.
//

import SwiftUI

struct TabBarCustomView: View {
    @State var itemData = ItemData()
    var body: some View {
        TabView {
            ItemList(itemData: $itemData)
                .tabItem {
                    Label("Menu", systemImage: "house")
                }

            ChartView(itemData: $itemData)
                .tabItem {
                    Label("Chart", systemImage: "chart.bar")
                }
            ApiListView()
                .tabItem {
                    Label("APICALL", systemImage: "7.square")
                }
            LoginView()
                .tabItem {
                    Label("Login", systemImage: "9.square")
                }
          
        }
    }
}

#Preview {
    TabBarCustomView()
}
