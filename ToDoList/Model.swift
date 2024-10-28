//
//  Model.swift
//  ToDoList
//
//  Created by TirthShah on 29/10/24.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    var id = UUID()
    let title: String
    var isComplete = false
}
