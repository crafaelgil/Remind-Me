//
//  TaskRepository.swift
//  Remind Me
//
//  Created by Carlos Gil on 2021/06/17.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        db.collection("tasks")
            .order(by: "createdTime")
            .addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    try? document.data(as: Task.self)
                }
            }
        }
    }
    
    func addTask(task: Task) {
        do {
            try db.collection("tasks").addDocument(from: task)
        }
        catch {
            fatalError("Unable to encode task: \(error)")
        }
    }
    
    func updateTask(task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("tasks").document(taskID).setData(from: task)
            }
            catch {
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }
    }
}
