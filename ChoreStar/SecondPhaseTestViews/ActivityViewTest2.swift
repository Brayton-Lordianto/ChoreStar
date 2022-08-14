//
//  ActivityViewTest2.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import SwiftUI

struct ActivityViewTest2: View {
    @State var showingSheet = false
    @State var completedChores = exampleChores.filter {$0.isCompleted}
    @State var uncompletedChores = exampleChores.filter {!$0.isCompleted}
    var body: some View {
        NavigationView {
            Form {
                list
                
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

extension ActivityViewTest2 {
    var list: some View {
        Section("uncompleted chores") {
            List {
                ForEach(uncompletedChores, id: \.name) { exampleChore in
                    NavigationLink(destination: {
                        if exampleChore.receivedByUser {
                            ClickChoreView(user: exampleUserInfo, chore: exampleChores[0])
                        } else {
                            // sent to the user having accepted it, and choice to accept it
                            OtherClickChoreView()
                        }
                    }, label: {
                        getRowView(chore: exampleChore)
                    })
                    
                }
            }
        }
    }
    
    var list2: some View {
        Section("completed chores history") {
            List {
//                Text("hi")
                ForEach(completedChores, id: \.name) { exampleChore in
                    getRowView(chore: exampleChore)
                }
            }
        }
    }

    func getRowView(chore: Chore) -> some View {
        HStack {
            chore.image
                .resizable()
                .frame(width: 50, height: 50)
            
            VStack {
                Text(chore.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.green)

                Text(chore.name)
                    .font(.subheadline)
            }
        }
    }
    
}

struct ActivityViewTest2_Previews: PreviewProvider {
    static var previews: some View {
        ActivityViewTest2()
    }
}
