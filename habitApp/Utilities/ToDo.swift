//
//  Task.swift
//  CS160MobileApp
//
//  Created by Frank on 2024/3/17.
//

import Foundation

struct ToDo: Identifiable {
    var id: UUID = UUID()
    var dayOffset: Int
    var time: String
    var title: String
}
