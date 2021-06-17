//
//  Task.swift
//  Remind Me
//
//  Created by Carlos Gil on 2021/06/16.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable{
    @DocumentID var id: String?
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
