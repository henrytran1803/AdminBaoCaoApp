//
//  ChartView.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 25/03/2024.
//

import SwiftUI
import Charts
enum ChartItem: String, CaseIterable, Identifiable {
    case pie = "PieChart"
    case bar = "BarChart"
    case line = "LineChart"
    var id: ChartItem { self }
}
struct ChartView: View {
    @State private var selectedChart: ChartItem = .pie
    @State private var selectedPeriod: Period = .now
    @Binding var itemData: ItemData
    @State var isAnimateChart = false
    var body: some View {
        VStack {
            Spacer()
            switch selectedChart {
            case .pie:
                PieChartView(itemData: $sortedItems).animation(.easeInOut)
            case .bar:
                BarChartView(itemData: $sortedItems).animation(.easeInOut)
            case .line:
                LineChartView(itemData: $sortedItems).animation(.easeInOut)
            }
            Spacer()
            Picker("Period", selection: $selectedPeriod) {
                ForEach(Period.allCases) { period in
                    Text(period.rawValue).tag(period)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: selectedPeriod) { _ in
                updateSortedItems()
            }
            Picker("Chart Type", selection: $selectedChart) {
                ForEach(ChartItem.allCases) { chart in
                    Text(chart.rawValue).tag(chart)
                }
            }
            .pickerStyle(.segmented)
        }
        .onAppear {
            updateSortedItems()
        }
    }
    
    @State private var sortedItems: [Item] = []
    
    private func updateSortedItems() {
        switch selectedPeriod {
        case .now:
            sortedItems = itemData.items.filter { $0.period == .now }
        case .nextSevenDays:
            sortedItems = itemData.items.filter { $0.period == .nextSevenDays }
        case .nextThirtyDays:
            sortedItems = itemData.items.filter { $0.period == .nextThirtyDays }
        case .past:
            sortedItems = itemData.items.filter { $0.period == .past }
        }
    }
}



struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        let ItemData = ItemData()
        ChartView(itemData: .constant(ItemData))
    }
}
extension Item {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: self.date)
    }
}
