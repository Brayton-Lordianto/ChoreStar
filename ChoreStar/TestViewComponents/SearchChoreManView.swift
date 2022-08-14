//
//  SearchChoreManView.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import SwiftUI

// I could easily use an array and filter results, but this is just a test to see the ap p flow. If I have time, I will clean it all up.
let secondExampleUserInfo = userInfo(img: Image(systemName: "person.circle"), name: "Mary Jane", shortDescription: "Hi there", moreDetails: "no more details")

struct SearchChoreManView: View {
    @State var text = ""
    var body: some View {
        VStack {
            Form {
                Section("Search by name") {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField(text: $text) {
                            Text("Type name here")
                        }
                        .textFieldStyle(OvalTextFieldStyle())
                    }
                }
                .listRowBackground(Color.clear)
                
                List {
                    if text == "" {
                        // add one more here
                        NavigationLink {Text("hi")} label: {
                            SingleChoreMan(user: secondExampleUserInfo)
                        }
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
                        NavigationLink {Text("hi")} label: {
                            SingleChoreMan(user: secondExampleUserInfo)
                        }
                    }
                }
            }
        }
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Capsule().opacity(0.1))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}

struct SearchChoreManView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchChoreManView()
        }
    }
}
