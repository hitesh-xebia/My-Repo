//
//  ProfileView.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 28/07/25.
//

import SwiftUI
import WidgetKit

struct ProfileView: View {
    
    @AppStorage("streak", store: UserDefaults(suiteName: "group.hitesh.chouhan.swiftuidemo")) var streak = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Circle()
                    .stroke(.white.opacity(0.1), lineWidth: 20)
                    .frame(maxWidth: .infinity)
                
                Circle()
                    .trim(from: 0, to: Double(streak)/100.0)
                    .stroke(.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(maxWidth: .infinity)
                
                    .rotationEffect(Angle(degrees: -90))
                
                VStack {
                    Text("Streak")
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                        .fontDesign(.rounded)
                    Text(String(streak))
                        .font(.system(size: 50))
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                }
            }
            .padding(50)
            .background(.black)
            
            Spacer()
            
            Button {
                streak += 1
                WidgetCenter.shared.reloadTimelines(ofKind: "MySwiftUIWidget")
            } label: {
                Text("+1")
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .cornerRadius(10)
                    .padding()
                    
            }
        }
        .background(.black)
    }
}

#Preview {
    ProfileView()
}
