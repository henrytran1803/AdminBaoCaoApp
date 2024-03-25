//
//  LinearChartView.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 25/03/2024.
//
import SwiftUI
import Charts

struct LinearChartView: View {
    @ObservedObject var itemData: ItemData
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color.accentColor.opacity(0.4),
                                                                    Color.accentColor.opacity(0)]),
                                        startPoint: .top,
                                        endPoint: .bottom)
    var body: some View {
        Chart {
            ForEach(itemData.items) { data in
                LineMark(x: .value("Year", data.formattedDate()),
                         y: .value("Population", data.title))
                    .interpolationMethod(.cardinal)
                    .symbol(by: .value("Pet type", "cat"))
                    .foregroundStyle(linearGradient)
            }
        }
        .chartXScale(domain: 1998...2024)
        .chartLegend(.hidden)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

struct LinearChartView_Previews: PreviewProvider {
    static var previews: some View {
        LinearChartView(itemData: ItemData())
    }
}


