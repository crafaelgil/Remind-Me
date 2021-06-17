//
//  TasksListViewModel.swift
//  Remind Me
//
//  Created by Carlos Gil on 2021/06/16.
//

import Foundation
import Combine

class TasksListViewModel: ObservableObject {
    @Published var tasksRepository = TaskRepository()
    @Published var tasksListViewModel = [SingleTaskViewModel]()
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        tasksRepository.$tasks
            .map { tasks in
                tasks.map { task in
                    SingleTaskViewModel(task: task)
                }
            }
            .assign(to: \.tasksListViewModel, on: self)
            .store(in: &cancellable)
    }
    
    func addTask(task: Task) {
        let taskVM = SingleTaskViewModel(task: task)
        
        self.tasksListViewModel.append(taskVM)
    }
}
