//
//  ItemList.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 25/03/2024.
//

import SwiftUI

struct ItemList: View {
    @Binding var itemData: ItemData
    @State private var isAddingNewEvent = false
    @State private var newItem = Item()
    @State private var selection: Item?
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                ForEach(Period.allCases) { period in
                    Section(header:sectionHeader(for: period)){
                        
                        ForEach(itemData.sortedEvents(period: period)) { item in
                            ItemRow(item: item)
                                .tag(item)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        selection = nil
                                        itemData.remove(item)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }.disabled(itemData.sortedEvents(period: period).isEmpty)
                    }
                }
            }
            .navigationTitle("Thống kê")
            // toolbar
            .toolbar {
                ToolbarItem {
                    Button {
                        newItem = Item()
                        isAddingNewEvent = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingNewEvent) {
                NavigationStack {
                    ItemEditor(item: $newItem, isNew: true)
                    
                    
                        .toolbar{
                            ToolbarItem (placement: .cancellationAction){
                                Button("Cancel") {
                                   isAddingNewEvent = false
                                }
                            }
                            ToolbarItem {
                                Button(action: {
                                    itemData.add(newItem)
                                    isAddingNewEvent = false
                                }) {
                                    Text("Add")
                                }
                                
                                .disabled(newItem.title.words.isEmpty)
                            }
                            
                        }
                }
                .presentationDetents([.height(500)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(20)
            }


            //
         
        } detail: {
            ZStack {
                if let item = selection, let eventBinding = itemData.getBindingToEvent(item) {
                    ItemEditor(item: eventBinding)
                } else {
                    Text("Select an Event")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
    private func sectionHeader(for period: Period) -> some View {
        let total = itemData.sortedEvents(period: period).reduce(into: 0) { result, item in
            result += item.title
        }
        return Text("\(period.name) có tổng là: (\(total))")
            .font(.callout)
            .foregroundColor(.secondary)
            .fontWeight(.bold)
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        let ItemData = ItemData()
        ItemList(itemData: .constant(ItemData))
    }
}
