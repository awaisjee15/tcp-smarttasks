//
//  TaskDetailView.swift
//  SmartTasks
//
//  Created by AwaisSalim on 24/06/2025.
//

import SwiftUI

struct TaskDetailView: View {
    let task: Task
    
    @Environment(\.presentationMode) var presentationDetailView
    
    var body: some View {
        ZStack {
            Color("BGColor")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                GeometryReader { geometry in
                    let imageHeight = geometry.size.height * 0.9
                    
                    ZStack(alignment: .topLeading) {
                        Image("Task details bg")
                            .resizable()
                            .padding()
                            .frame(width: geometry.size.width, height: imageHeight)
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 16) {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(task.title)
                                    .font(.custom("AmsiPro-Bold", size: 22))
                                    .foregroundColor(.red)
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.5)
                                
                                
                            }
                            .padding(.horizontal, 10)
                            .padding(.top, 70)
                            SectionDivider()
                            HStack {
                                InfoRow(title: "Due Date", value: task.dueDate ?? "", alignment: .leading)
                                Spacer()
                                InfoRow(title: "Days Left", value: "\(task.daysLeft ?? 0)", alignment: .trailing)
                            }
                            
                            SectionDivider()
                            
                            VStack(alignment: .leading, spacing: 0) {
                                
                                Text(task.description)
                                    .frame(minHeight: 100, alignment: .top)
                                    .font(.custom("AmsiPro-Regular", size: 15))
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: false, vertical: true)
                            }.padding(.horizontal, 10)
                            
                            SectionDivider()
                            
                            Text("Unresolved")
                                .font(.custom("AmsiPro-Bold", size: 15))
                                .foregroundColor(.orange)
                                .padding(.horizontal, 10)
                            
                        }
                        .padding(.horizontal, 16)
                        .frame(width: geometry.size.width, height: imageHeight, alignment: .top)
                    }
                }
                .frame(height: UIScreen.main.bounds.height * 0.5)
                
                HStack(spacing: 20) {
                    ActionButton(title: "Resolve", backgroundColor: .green) {
                        // Reslove button action
                    }
                    
                    ActionButton(title: "Cannot Resolve", backgroundColor: .red) {
                        // Cannot Resolve button action
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, (UIScreen.main.bounds.height * UIScreen.main.scale) * 0.08)
            }
        }.navigationBarTitle("Task Detail", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationDetailView.wrappedValue.dismiss()
                    }) {
                        HStack{
                            Image("Arrow back")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .foregroundColor(.white)
            .onAppear {
                if let customFont = UIFont(name: "AmsiPro-Bold", size: 22) {
                    UINavigationBar.appearance().titleTextAttributes = [
                        .font: customFont,
                        .foregroundColor: UIColor.white
                    ]
                    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                }
            }
    }
}


struct InfoRow: View {
    let title: String
    let value: String
    let alignment: HorizontalAlignment
    
    var body: some View {
        VStack(alignment: alignment, spacing: 10) {
            Text(title)
                .font(.custom("AmsiPro-Regular", size: 12))
                .foregroundColor(.red)
            
            Text(value)
                .font(.custom("AmsiPro-Bold", size: 15))
                .foregroundColor(.red)
        }
        .padding(.horizontal, 10)
    }
}

struct SectionDivider: View {
    var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.3))
            .frame(height: 1)
            .padding(.horizontal, 10)
    }
}

struct ActionButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("AmsiPro-Bold", size: 16))
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}



