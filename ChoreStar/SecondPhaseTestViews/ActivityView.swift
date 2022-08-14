//
//  ActivityView.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import SwiftUI

struct ActivityView: View {
    @State var showingSheet = false
    var completedChores: [Chore] {
        exampleChores.filter {$0.isCompleted}
    }
    var uncompletedChores: [Chore] {
        exampleChores.filter {!$0.isCompleted}
    }
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
            }
            .onAppear {
                print("DEBUG")
                print(exampleChores[0].isCompleted)
            }
        }
    }
}

extension ActivityView {
    var list: some View {
        Section("uncompleted chores") {
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
                }
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
