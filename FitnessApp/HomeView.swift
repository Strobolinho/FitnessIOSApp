//
//  HomeView.swift
//  FitnessApp
//
//  Created by Nicolas Ströbel on 20.05.25.
//

import SwiftUI

struct HomeView: View {
    
    @State var calories: Int = 123
    @State var active: Int = 30
    @State var stand: Int = 8
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            Text("Welcome")
                .font(.largeTitle)
                .padding()
            
            HStack {
                
                Spacer()
                
                VStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Calories")
                            .font(.callout)
                            .bold()
                            .foregroundStyle(.red)
                        
                        Text("123 kcal")
                            .bold()
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Active")
                            .font(.callout)
                            .bold()
                            .foregroundStyle(.green)
                        
                        Text("52 mins")
                            .bold()
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Stand")
                            .font(.callout)
                            .bold()
                            .foregroundStyle(.blue)
                        
                        Text("8 hours")
                            .bold()
                    }
                }
                
                Spacer()
                
                ZStack {
                    ProgressCircleView(progress: $calories, color: .red, goal: 600)
                    
                    ProgressCircleView(progress: $active, color: .green, goal: 60)
                        .padding(.all, 20)
                    
                    ProgressCircleView(progress: $stand, color: .blue, goal: 12)
                        .padding(.all, 40)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
