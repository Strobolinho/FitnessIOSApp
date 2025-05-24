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
    
    var mockActivities = [
        Activity(id: 0, title: "Heute", subtitle: "Schritte", image: "figure.walk", tintColor: .blue, amount: "10,000"),
        Activity(id: 1, title: "Morgen", subtitle: "Joggen", image: "figure.run", tintColor: .red, amount: "584"),
        Activity(id: 2, title: "Gestern", subtitle: "Pausen", image: "figure.stand", tintColor: .orange, amount: "3"),
        Activity(id: 3, title: "Übermorgen", subtitle: "Sex", image: "figure.socialdance.circle", tintColor: .green, amount: "5h")
    ]
    
    var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", tintColor: .green, duration: "23 mins", date: "Aug 8", calories: "312 kcal"),
        Workout(id: 1, title: "Weight Lifting", image: "dumbbell", tintColor: .black, duration: "90 mins", date: "Aug 9", calories: "564 kcal"),
        Workout(id: 2, title: "Basketball", image: "figure.basketball", tintColor: .orange, duration: "90 mins", date: "Aug 20", calories: "684 kcal"),
        Workout(id: 3, title: "Fußball", image: "figure.soccer", tintColor: .blue, duration: "120 mins", date: "Aug 11", calories: "884 kcal")
    ]
    
    var body: some View {
        
        NavigationStack {
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
                        ForEach(mockActivities, id: \.id) { activity in
                            ActivityCardView(activity: activity)
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Recent Workouts")
                            .font(.title2)
                        
                        Spacer()
                        
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Text("Show more")
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(20)
                            
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    LazyVStack {
                        ForEach(mockWorkouts, id: \.id) { workout in
                            WorkoutCardView(workout: workout)
                        }
                    }
                    .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
