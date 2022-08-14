//
//  ActivityView3.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import SwiftUI

struct ActivityView3: View {
    @State var showingSheet = false
    @State var completedChores = exampleChores.filter {$0.isCompleted}
    @State var uncompletedChores = exampleChores.filter {!$0.isCompleted}
    var body: some View {
        NavigationView {
            Form {
                list
                    .onTapGesture {
                        showingSheet.toggle()
                    }
                
                    .sheet(isPresented: $showingSheet) {
                        ClickChoreView(user: exampleUserInfo, chore: exampleChores[0])
                    }
                
                list2
                
            }
            .onAppear {
                print("DEBUG")
                print(exampleChores[0].isCompleted)
                completedChores = exampleChores.filter {$0.isCompleted}
                uncompletedChores = exampleChores.filter {!$0.isCompleted}
            }
        }
    }
}

extension ActivityView3 {
    var list: some View {
        Section("ongoing chores") {
            List {
                ForEach(uncompletedChores, id: \.name) { exampleChore in
                    VStack {
                        Text(exampleChore.name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.green)

                        Text(exampleChore.name)
                            .font(.subheadline)
                    }
                }.tag(uncompletedChores.count)
            }
        }
    }
    
    var list2: some View {
        Section("completed chores history") {
            List {
//                Text("hi")
                ForEach(completedChores, id: \.name) { exampleChore in
                    VStack {
                        Text(exampleChore.name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.green)

                        Text(exampleChore.name)
                            .font(.subheadline)
                    }
                }
            }
        }
    }

}

struct ActivityView3_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView3()
    }
}
