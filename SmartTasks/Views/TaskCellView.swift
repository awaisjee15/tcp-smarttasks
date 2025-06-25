
//
//  TaskCellView.swift
//  SmartTasks
//
//  Created by AwaisSalim on 24/06/2025.
//


import SwiftUI

struct TaskCellView: View {
    @State var title: String
    @State var dueDate: String
    @State var daysLeft: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(title)
                .font(.custom("AmsiPro-Bold", size: 15))
                .foregroundColor(.red)
                .padding(.top, 10)
            
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 1)
                .padding(.vertical, 3)
            
            HStack {
                VStack(alignment: .leading, spacing: 7) {
                    Text("Due date")
                        .font(.custom("AmsiPro-Regular", size: 10))
                        .foregroundColor(.gray)
                    
                    Text(dueDate)
                        .font(.custom("AmsiPro-Bold", size: 15))
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 7) {
                    Text("Days left")
                        .font(.custom("AmsiPro-Regular", size: 10))
                        .foregroundColor(.gray)
                    
                    Text("\(daysLeft)")
                        .font(.custom("AmsiPro-Bold", size: 15))
                        .foregroundColor(.red)
                }
            }
            .padding(.bottom, 10)
        }
        .padding(.horizontal, 10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.1), radius: 3, x: 0, y: 2)
        .padding(.horizontal, 10)
        .frame(minHeight: 80)
    }
}



//#Preview {
//    TaskCellView()
//}
