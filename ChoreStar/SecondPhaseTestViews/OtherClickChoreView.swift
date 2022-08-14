//
//  OtherClickChoreView.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import SwiftUI

// this view is when the chore is not taken by a volunteer, but a volunteer has selected it
struct OtherClickChoreView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showingSheet = false
    var body: some View {
        Form {
            VStack {
                centered(view:
                HStack {
                    Text("The user")
                    Text("Jimmy Fallon").foregroundColor(.blue)
                        .onTapGesture {
                            showingSheet = true
                        }
                    Text("wants to help")
                }
                 )
                Text("\n\n")
                Button {
                    exampleChores[0].receivedByUser = true
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .cornerRadius(12)
                        .shadow(radius: 12)
                        .overlay(
                            Text("Accept")
                                .foregroundColor(.green)
                        )
                }
                
                Button {
                    
                } label: {
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(height: 50)
                        .cornerRadius(12)
                        .shadow(radius: 12)
                        .overlay(
                            Text("Decline")
                                .foregroundColor(.white)
                        )
                }


            }
        }
        .sheet(isPresented: $showingSheet) {
            NavigationView {
                Profile(user: exampleProfile2)
                    .toolbar {
                        HStack {
                            Image("phone.fill")
                            Button("Contact") {}
                        }
                    }
            }
        }
    }
}

struct OtherClickChoreView_Previews: PreviewProvider {
    static var previews: some View {
        OtherClickChoreView()
    }
}
