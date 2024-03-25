//
//  ItemRow.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 25/03/2024.
//

import SwiftUI


struct ItemRow: View {
    @ScaledMetric var imageWidth: CGFloat = 40
    
    let item: Item
    
    var body: some View {
        HStack {
            Label {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(item.title)")
                        .fontWeight(.bold)
                        .foregroundColor(Color(item.color))
                    Text(item.date.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            } icon: {
                
            }
        }.labelStyle(CustomLabelStyle())
    }
}


struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Item(id: UUID()))
    }
}

struct CustomLabelStyle: LabelStyle { // style lbel chỉnh sửa icon scale hinh anh
  @ScaledMetric private var iconWidth: Double = 40
  func makeBody(configuration: Configuration) -> some View {
    HStack(spacing: 0) {
      configuration.icon
        .imageScale(.large)
        .frame(width: iconWidth)
      configuration.title
    }
  }
}


