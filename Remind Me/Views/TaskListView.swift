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
    
    @State var presentAddNewItem = false
    @State var showSignInForm = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(tasksListVM.tasksListViewModel) { singleTaskVM in
                        SingleTaskView(singleTaskVM: singleTaskVM)
                    }
                    if presentAddNewItem {
                        SingleTaskView(singleTaskVM: SingleTaskViewModel(task: Task(title: "", completed: false))) { task in
                            self.tasksListVM.addTask(task: task)
                            self.presentAddNewItem.toggle()
                        }
                    }
                }
                Button(action: { self.presentAddNewItem.toggle() }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Add new task")
                    }
                }
                .padding()
            }
            .sheet(isPresented: $showSignInForm) {
                SignInView()
            }
            .navigationBarItems(trailing: Button(action: { self.showSignInForm.toggle()}) {
                Image(systemName: "person.circle")
            })
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
    
    var onCommit: (Task) -> (Void) = { _ in }
    
    var body: some View {
        HStack {
            Image(systemName: singleTaskVM.task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    singleTaskVM.task.completed.toggle()
                }
            TextField("Add new item to the list", text: $singleTaskVM.task.title, onCommit: {
                self.onCommit(self.singleTaskVM.task)
            })
                .padding()
        }
    }
}
