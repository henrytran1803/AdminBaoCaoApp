//
//  ItemList.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 25/03/2024.
//

import SwiftUI

struct ItemList: View {
    @ObservedObject var itemData: ItemData
    @State private var isAddingNewEvent = false
    @State private var newItem = Item()
    @State private var selection: Item?
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                ForEach(Period.allCases) { period in
                    Section(header: Text(period.name).font(.callout).foregroundColor(.secondary).fontWeight(.bold)){
                        
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
//                        .toolbar {
//                            ToolbarItem {
//                                Button("Cancel") {
//                                   isAddingNewEvent = false
//                                }
//                            }
//                            
//                            ToolbarItem {
//                                Button(action: {
//                                    itemData.add(newItem)
//                                    isAddingNewEvent = false
//                                }) {
//                                    Text("Add")
//                                }
//                                .disabled(newItem.title.isEmpty)
//                            }
//                        }
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
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList(itemData: ItemData())
    }
}
