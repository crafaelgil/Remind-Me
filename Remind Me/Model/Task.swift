//
//  Task.swift
//  Remind Me
//
//  Created by Carlos Gil on 2021/06/16.
//

import Foundation

struct Task{
    var title: String
    var completed: Bool
}

#if DEBUG
let testData = [
    Task(title: "Implement UI", completed: true),
    Task(title: "Connect to Firebase", completed: false),
    Task(title: "Next task", completed: false)
]
#endif
