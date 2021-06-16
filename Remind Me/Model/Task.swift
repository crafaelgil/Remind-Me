//
//  Task.swift
//  Remind Me
//
//  Created by Carlos Gil on 2021/06/16.
//

import Foundation

struct Task: Identifiable{
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG
let testDataTasks = [
    Task(title: "Implement UI", completed: true),
    Task(title: "Connect to Firebase", completed: false),
    Task(title: "Next task", completed: false)
]
#endif
