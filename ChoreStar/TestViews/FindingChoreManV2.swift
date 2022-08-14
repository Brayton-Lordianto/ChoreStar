//
//  FindingChoreManV2.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import SwiftUI

struct FindingChoreManV2: View {
    

    
    @State var
    search = ""
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Form {
                        
                        Section("Your Location") {
                            Text("Singapore, Marina Bay Sands")
                            NavigationLink("Change Location") {SearchChoreManView()}
                                .foregroundColor(.green)
                            NavigationLink("Search by Name Instead") {SearchChoreManView()}
                                .foregroundColor(.green)
                        }
                        .shadow(radius: 15)

                        
                        Section("Recently active Near You") {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0..<5) {_ in
                                        NavigationLink {
                                            ChoreManFullView(user: exampleUserInfo)
                                        } label: {
                                            SingleChoreManV2(user: exampleUserInfo)
                                                .padding()
                                        }
                                        .foregroundColor(.black)
                                    }
                                }
                            }
                            .listRowBackground(Color.clear)
                        }
                        .frame(width: .infinity)
//                        .border(Color.red)

                        Section("Great Ratings near you") {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0..<5) {_ in
                                        NavigationLink {
                                            Text("hi")
                                        } label: {
                                            SingleChoreManV2(user: exampleUserInfo)
                                                .padding()
                                        }
                                        .foregroundColor(.black)
                                    }
                                }
                            }.listRowBackground(Color.clear)
                        }

                        Section("new to chorestar") {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0..<5) {_ in
                                        NavigationLink {
                                            Text("hi")
                                        } label: {
                                            SingleChoreManV2(user: exampleUserInfo)
                                                .padding()
                                        }
                                        .foregroundColor(.black)
                                    }
                                }
                            }.listRowBackground(Color.clear)
                        }

                        Button {
                            // maybe bring out the map as a sheet
                        } label: {
                            Text("Find by Location")
                        }

                        
                    }
//                    .border(Color.green)
                    .background(Color.yellow)
                }
                
//                Color.white.opacity(0.2).ignoresSafeArea()
                
                .navigationTitle("Volunteers Near You!")
            }
        }
    }
}

struct FindingChoreManV2_Previews: PreviewProvider {
    static var previews: some View {
        FindingChoreManV2()
    }
}
