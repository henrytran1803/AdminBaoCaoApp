//
//  PieChartLogin.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 31/03/2024.
//

import SwiftUI
import Charts

struct dataLogin : Identifiable {
    var id: UUID
    var name: String
    var value: Int
    
    init(id: UUID, name: String, value: Int) {
        self.id = id
        self.name = name
        self.value = value
    }
}

struct PieChartLogin: View {
    @Binding var data: [dataLogin]
    

    
    var body: some View {
        VStack {
            Chart(data) { product in
                SectorMark(
                    angle: .value(
                        Text(verbatim: product.name),
                        product.value
                    ),
                    innerRadius: .ratio(0.6),
                    angularInset: 8
                )
                .foregroundStyle(
                    by: .value(
                        Text(verbatim: product.name),
                        product.name
                    )
                )
            }.animation(.smooth)
            .frame(width: 300, height: 300)
            .padding()
        }
    }
}

//struct PieChartLogin_Previews: PreviewProvider {
//    static var previews: some View {
//        PieChartLogin(data: )
//    }
//}
