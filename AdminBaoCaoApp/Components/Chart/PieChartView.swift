//
//  PieChartView.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 25/03/2024.
//

import SwiftUI
import Charts


struct PieChartView: View {
    @Binding var itemData: [Item]
    var body: some View {
        Chart(itemData) { product in
            SectorMark(
                angle: .value(
                    Text(verbatim: product.formattedDate()),
                    product.title
                ),
                innerRadius: .ratio(0.6),
                angularInset: 8
    
                    
            )
            .foregroundStyle(
                by: .value(
                    Text(verbatim: product.formattedDate()),
                    product.formattedDate()
                )
            )
            
            
        }
    }

}
//struct PieChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        PieChartView(itemData: ItemData().items)
//    }
//}
