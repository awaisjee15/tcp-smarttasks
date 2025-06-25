//
//  EmptyStateView.swift
//  SmartTasks
//
//  Created by AwaisSalim on 24/06/2025.
//

import SwiftUI

struct EmptyStateView : View{
    
    var body: some View {
        ZStack{
            Color("BGColor")
                .ignoresSafeArea()
            VStack{
                Image("Empty screen illustration")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                
                Text("No tasks for today!")
                    .font(.custom("AmsiPro-Bold", size: 30))
                    .foregroundColor(.white)
                    .padding(.top, 40)
            }
            .padding(.horizontal)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}
