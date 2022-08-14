//
//  ChoreHomeViewV2.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import SwiftUI

struct ChoreHomeViewV2: View {
    @State var classification: Classification = .cleaning
    @State var text = ""
    var chores: [Chore] {
        exampleChores.filter { $0.classification == classification }
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                addButton

                Group {
                    searchBar
                    
                    filters
                    
                    list
                }
            }
            
            .navigationBarTitle("Chores")
            .foregroundColor(.green)
        }
    }
}

extension ChoreHomeViewV2 {
    var addButton: some View {
        HStack {
            Spacer()
            Rectangle()
                .fill(Color.green)
                .cornerRadius(12)
                .frame(width: 150, height: 40)
                .overlay(
                    HStack {
                        Text("Add a Chore")
                        Image(systemName: "plus")
                    }
                )
                .foregroundColor(.white)
                .padding(1)
        }
            .listRowBackground(Color.clear)
    }
    
    var searchBar: some View {
        Section("Search by name") {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField(text: $text) {
                    Text("Type chore description here")
                }
                .textFieldStyle(OvalTextFieldStyle())
            }
        }
        .listRowBackground(Color.clear)
    }
    
    var filters: some View {
        Section("Filters") {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Classification.allCases, id: \.self) { cf in
                        Button {
                            
                        } label: {
                            Capsule()
                                .fill(.green)
                                .frame(width: 100, height: 25)
                                .overlay(
                                    Text(cf.rawValue)
                                        .foregroundColor(.white)
                                )
                                .padding(1)
                        }

                    }
                }
            }
            .listRowBackground(Color.clear)
        }
    }
    
    var list: some View {
        ForEach(Classification.allCases, id: \.self) { cf in
            Section(cf.rawValue) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(exampleChores.filter {$0.classification == cf}, id: \.name) { chore in
                            NavigationLink {
                                ChoreInfoView(chore: chore)
                            } label: {
                                SingleChoreToFind(chore: chore)
                            }
                            
                        }
                    }
                }
                .listRowBackground(Color.clear)
            }
        }
    }
}

struct ChoreHomeViewV2_Previews: PreviewProvider {
    static var previews: some View {
            ChoreHomeViewV2()
    }
}
