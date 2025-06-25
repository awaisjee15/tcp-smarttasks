//
//  TaskListView.swift
//  SmartTasks
//
//  Created by AwaisSalim on 24/06/2025.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var taskListViewModel = TaskListViewModel()
    @State private var selectedTask: Task? = nil
    @State private var isItemClicked = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BGColor")
                    .ignoresSafeArea()
                
                if taskListViewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = taskListViewModel.errorMessage {
                    VStack {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                        
                        Button {
                            taskListViewModel.loadTasks()
                        } label: {
                            Text("Retry")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    
                }  else {
                    VStack(spacing: 10) {
                        HStack {
                            Button(action: {
                                //action for back day
                            }) {
                                Image("Arrow back")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.white)
                                
                                
                                
                            }
                            
                            Spacer()
                            
                            Text("Today")
                                .font(.custom("AmsiPro-Bold", size: 25))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                // action for next day
                            }) {
                                Image("Arrow forward")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.white)
                                
                            }
                        }
                        .padding(.horizontal,5)
                        
                        if taskListViewModel.filteredTasks.isEmpty {
                            EmptyStateView()
                        }else{
                            List(taskListViewModel.filteredTasks) { task in
                                
                                TaskCellView(title: task.title, dueDate: task.dueDate ?? "", daysLeft: task.daysLeft ?? 0)
                                    .onTapGesture {
                                        selectedTask = task
                                        isItemClicked = true
                                    }
                                
                                    .listRowBackground(Color.clear)
                                    .listRowSeparator(.hidden)
                            }
                            .listStyle(PlainListStyle())
                            .navigationDestination(isPresented: $isItemClicked) {
                                if let selectedTask = selectedTask {
                                    TaskDetailView(task: selectedTask)
                                }
                            }
                            .background(Color.clear)
                        }
                    }
                }
            }
            .onAppear {
                taskListViewModel.loadTasks()
            }
        }
        
    }
    
    
    private func todayFormatted() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        return formatter.string(from: Date())
    }
    
}

//#Preview {
//    TaskListView()
//}
