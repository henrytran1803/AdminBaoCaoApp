//
//  ItemEditor.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 25/03/2024.
//

import SwiftUI

struct ItemEditor: View {
    @Binding var item: Item
    @State var isNew = false
    
    @Environment(\.dismiss) private var dismiss
    @State private var isPickingSymbol = false
    
    var body: some View {
        List {
            HStack {
                TextField("Enter a number", text: Binding(
                    get: { String(item.title) },
                    set: { if let newValue = Int($0) { item.title = newValue } }
                ))
                .font(.title2)
                .keyboardType(.numberPad)
                .padding()
            }
            .padding(.top, 5)
            
            DatePicker("Date", selection: $item.date)
                .labelsHidden()
                .listRowSeparator(.hidden)
            
 
        }
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

struct ItemEditor_Previews: PreviewProvider {
    static var previews: some View {
        ItemEditor(item: .constant(Item(id: UUID())), isNew: true)
            .environmentObject(ItemData())
    }
}
