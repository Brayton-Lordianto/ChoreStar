//
//  HomeTest.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import SwiftUI

enum UserMode {
case volunteer
case client
}

struct HomeTest: View {
    var userMode = UserMode.client
    var userModeTitle: String {
        "Your profile is a  " + (userMode == .client ? "chore-giver" : "chore-star volunteer")
    }
    
    var body: some View {
        NavigationView {
            TabView {
                Text("hi")
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                Text("hi2")
                    .tabItem {
                        Label("Chores", systemImage: "hare")
                    }
                
                Text("hi2")
                    .tabItem {
                        Label("Chore Records", systemImage: "pencil.and.ellipsis.rectangle")
                    }
                
                Text("hi2")
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
                
            }
            .navigationTitle(userModeTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeTest_Previews: PreviewProvider {
    static var previews: some View {
        HomeTest()
    }
}
