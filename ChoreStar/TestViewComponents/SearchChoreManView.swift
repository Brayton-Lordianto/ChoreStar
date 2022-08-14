//
//  SearchChoreManView.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import SwiftUI

struct SearchChoreManView: View {
    @State var text = ""
    var body: some View {
        VStack {
            Form {
                Section("Search by name") {
                    TextField(text: $text) {
                        HStack {
                            Text("Type name here")
                        }
                    }

                }
                
                List {
                    if text == "" {
                        // add one more here
                        
                        ForEach(0..<5) {_ in
                            NavigationLink {
                                Text("hi")
                            } label: {
                                SingleChoreMan(user: exampleUserInfo)
                            }
                        }
                    } else if text.first == "J" {
                        ForEach(0..<5) {_ in
                            NavigationLink {
                                Text("hi")
                            } label: {
                                SingleChoreMan(user: exampleUserInfo)
                            }
                        }
                    } else {
                        // do single here
                    }
                }
            }
        }
    }
}

struct SearchChoreManView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchChoreManView()
        }
    }
}
