//
//  ContentView.swift
//  Remind Me
//
//  Created by Carlos Gil on 2021/06/16.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var tasksListVM = TasksListViewModel()
    let tasks = testDataTasks
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(tasksListVM.tasksListViewModel) { singleTaskVM in
                    SingleTaskView(singleTaskVM: singleTaskVM)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Add new task")
                    }
                }
                .padding()
            }
            .navigationTitle("Tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct SingleTaskView: View {
    @ObservedObject var singleTaskVM: SingleTaskViewModel
    
    var body: some View {
        HStack {
            Image(systemName: singleTaskVM.task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
            Text(singleTaskVM.task.title)
                .padding()
        }
    }
}
