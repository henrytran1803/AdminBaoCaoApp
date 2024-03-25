//
//  ItemData.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 25/03/2024.
//

import Foundation
import SwiftUI


class ItemData: ObservableObject {
    @Published var items: [Item] = [
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 1)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 2)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 3)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 4)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 5)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 6)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 7)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 8)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 9)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 10)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 11)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 12)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 13)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 14)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 15)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 16)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 17)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 18)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 19)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 20)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 21)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 22)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 23)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 24)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 25)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 26)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 27)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 28)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 29)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 30)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 31)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 32)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 33)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 34)),
        Item(id: UUID(), date: Date.roundedHoursFromNow(-60 * 60 * 24 * 35))
    ]

    func sortedEvents(period: Period) -> [Item] {
        return self.items
            .filter { $0.period == period}
            .sorted { $0.date < $1.date }
    }
    
    func add(_ item: Item) {
        items.append(item)
    }
        
    func remove(_ item: Item) {
        items.removeAll { $0.id == item.id}
    }
    func getBindingToEvent(_ item: Item) -> Binding<Item>? {
        Binding<Item>(
            get: {
                guard let index = self.items.firstIndex(where: { $0.id == item.id }) else { return self.items[0] }
                return self.items[index]
            },
            set: { item in
                guard let index = self.items.firstIndex(where: { $0.id == item.id }) else { return }
                self.items[index] = item
            }
        )
    }
    
    
}
extension Date {
    static func from(month: Int, day: Int, year: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let calendar = Calendar(identifier: .gregorian)
        if let date = calendar.date(from: dateComponents) {
            return date
        } else {
            return Date.now
        }
    }

    static func roundedHoursFromNow(_ hours: Double) -> Date {
        let exactDate = Date(timeIntervalSinceNow: hours)
        guard let hourRange = Calendar.current.dateInterval(of: .hour, for: exactDate) else {
            return exactDate
        }
        return hourRange.end
    }
    
}
