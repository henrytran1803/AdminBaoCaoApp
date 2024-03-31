//
//  TabBarCustomView.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 25/03/2024.
//

import SwiftUI

struct TabBarCustomView: View {
    var body: some View {
        TabView {
            ItemList(itemData: ItemData())
                .tabItem {
                    Label("Menu", systemImage: "house")
                }

            ChartView(itemData: ItemData())
                .tabItem {
                    Label("Chart", systemImage: "chart.bar")
                }
            ApiListView()
                .tabItem {
                    Label("Login", systemImage: "7.square")
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
