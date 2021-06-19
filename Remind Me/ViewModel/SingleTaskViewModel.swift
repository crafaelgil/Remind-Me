//
//  SingleTaskViewModel.swift
//  Remind Me
//
//  Created by Carlos Gil on 2021/06/16.
//

import Foundation
import Combine
import SwiftUI

class SingleTaskViewModel: ObservableObject, Identifiable {
    @Published var taskRepository = TaskRepository()
    @Published var task: Task
    
    var id = ""
    @Published var completionStateIconName = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        
        $task
            .map{ task in
                task.completed ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellable)
        
        $task
            .compactMap{ task in
                task.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellable)
        
        $task
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink {task in
                self.taskRepository.updateTask(task: task)
            }
            .store(in: &cancellable)
    }
}
