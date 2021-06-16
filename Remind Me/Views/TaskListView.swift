//
//  ContentView.swift
//  Remind Me
//
//  Created by Carlos Gil on 2021/06/16.
//

import SwiftUI

struct TaskListView: View {
    let tasks = testDataTasks
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(tasks) { task in
                    Image(systemName: "circle")
                    Text(task.title)
                        .padding()
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
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
