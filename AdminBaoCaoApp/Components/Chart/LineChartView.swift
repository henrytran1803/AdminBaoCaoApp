//
//  LineChartView.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 25/03/2024.
//
import SwiftUI
import Charts
struct LineChartView: View {
    @Binding var itemData: [Item]
    var body: some View {
        Chart {
            ForEach(itemData) { data in
                LineMark(x: .value("Day", data.formattedDate()),
                        y: .value("Value", Double(data.title) ))
                    .cornerRadius(10)
                    .foregroundStyle(.linearGradient(colors: [Color(data.color), .purple], startPoint: .top, endPoint: .bottom))
                    
            }
        }
        .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
        .frame(maxWidth: .infinity)
        .frame(height: 300)
        
    }
}

