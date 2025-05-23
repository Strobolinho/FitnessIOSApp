//
//  ActivityCardView.swift
//  FitnessApp
//
//  Created by Nicolas Ströbel on 20.05.25.
//

import SwiftUI



struct Activity {
    let id: Int
    let title: String
    let subtitle: String
    let image: String
    let tintColor: Color
    let amount: String
}


struct ActivityCardView: View {
    
    @State var activity: Activity
    
    var body: some View {
        
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(activity.title)
                        
                        Text(activity.subtitle)
                    }
                    
                    Spacer()
                    
                    Image(systemName: activity.image)
                        .foregroundStyle(activity.tintColor)
                }
                
                Text(activity.amount)
                    .font(.title)
                    .bold()
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    ActivityCardView(activity: Activity(id: 0, title: "Test", subtitle: "Test Untertitel", image: "figure.walk", tintColor: .red, amount: "5674"))
}
