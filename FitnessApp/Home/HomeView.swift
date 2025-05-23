//
//  HomeView.swift
//  FitnessApp
//
//  Created by Nicolas Ströbel on 20.05.25.
//

import SwiftUI


struct HomeView: View {
    
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    
    var mockData = [
        Activity(id: 0, title: "Heute", subtitle: "Schritte", image: "figure.walk", tintColor: .blue, amount: "10,000"),
        Activity(id: 1, title: "Morgen", subtitle: "Kalorien verbrannt", image: "figure.run", tintColor: .red, amount: "584"),
        Activity(id: 2, title: "Gestern", subtitle: "Pausen", image: "figure.stand", tintColor: .orange, amount: "3"),
        Activity(id: 3, title: "Übermorgen", subtitle: "Sex", image: "figure.skiing.downhill", tintColor: .green, amount: "5h")
    ]
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading) {
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
                
                HStack {
                    Text("Fitness Activity")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        print("Show more")
                    } label: {
                        Text("Show more")
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(20)
                            
                    }
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 29),
                                         count: 2)) {
                    ForEach(mockData, id: \.id) { activity in
                        ActivityCardView(activity: activity)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
