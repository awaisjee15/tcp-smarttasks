//
//  SplashScreenView.swift
//  SmartTasks
//
//  Created by AwaisSalim on 25/06/2025.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            TaskListView()
        } else {
            ZStack {
                Color("BGColor")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Image("Smart Tasks logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 280)
                        .padding(80)
                    
                    Image("Intro screen illustration")
                        .resizable()
                        .frame(width: 280, height: 280)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(edges: .bottom)
            }
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
            
        }
    }
}


#Preview {
    SplashScreenView()
}
