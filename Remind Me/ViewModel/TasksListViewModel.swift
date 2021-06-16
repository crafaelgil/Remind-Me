//
//  TasksListViewModel.swift
//  Remind Me
//
//  Created by Carlos Gil on 2021/06/16.
//

import Foundation
import Combine

class TasksListViewModel: ObservableObject {
    @Published var tasksListViewModel = [SingleTaskViewModel]()
    
    init() {
        self.tasksListViewModel = testDataTasks.map{ task in
            SingleTaskViewModel(task: task)
        }
    }
}
