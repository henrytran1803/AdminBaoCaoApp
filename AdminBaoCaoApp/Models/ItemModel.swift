//
//  ItemModel.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 25/03/2024.
//

import SwiftUI
import SwiftData

enum Period: String, CaseIterable, Identifiable {
    case nextSevenDays = "7 Days"
    case nextThirtyDays = "30 Days"
    case now = "Now"
    case past = "past"
    
    var id: String { self.rawValue }
    var name: String { self.rawValue }
}

struct Item: Identifiable, Hashable, Codable {
    var id = UUID()
    var color: RGBAColor = ColorOptions.random().rgbaColor
    var title = 10
    var date = Date.now
    
    var period: Period {
        let yesterday = Calendar.autoupdatingCurrent.date(byAdding: .day, value: -1, to: Date.now)!
        
//        if date <= yesterday{
//            return .now
//        } else if date > Date.now && date <= Date.now.sevenDaysOut {
//            return .nextSevenDays
//        } else if date > Date.now.sevenDaysOut && date <= Date.now.thirtyDaysOut {
//            return .nextThirtyDays
//        } else {
//            return .past
//        }
        if date < Date.now.thirtyDaysOut {
            return .past
        }else if date < Date.now.sevenDaysOut && date >= Date.now.thirtyDaysOut {
            return .nextThirtyDays
        } else if date < yesterday && date >= Date.now.sevenDaysOut {
            return .nextSevenDays
        }else {
            return .now
        }
        
        
    }
}


extension Date {
    var sevenDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: -7, to: self) ?? self
    }
    
    var thirtyDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: -30, to: self) ?? self
    }
}
