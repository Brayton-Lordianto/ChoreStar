//
//  ClickChoreViewV2.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import SwiftUI

struct ClickChoreViewV2: View {
    @Environment(\.presentationMode) var presentationMode
    var pm = PaymentManager()
    var user: userInfo // the user that will get the money
    var chore: Chore
    var body: some View {
        Form {
            Section("Profile of volunteer") {
                ProfileEmbed(user: user)
                    .frame(height: .infinity)
            }
//                .listRowBackground(Color.clear)
            
            // select payment or not
            Section("Completed the task ?") {
                Button {
                    Task {
                        await pm.purchase()
                        exampleChores[0].isCompleted = true
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(height: 50)
                        .cornerRadius(12)
                        .shadow(radius: 12)
                        .overlay(
                            Text("Give a $0.99 Tip to John Doe")
                                .foregroundColor(.white)
                        )
                }

                Button {
                    exampleChores[0].isCompleted = true
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .cornerRadius(12)
                        .shadow(radius: 12)
                        .overlay(
                            Text("Don't Give Tip and mark completed")
                                .foregroundColor(.green)
                        )
                }
            }
            
        }
        .toolbar { Button("Contact") {} }
        .onAppear {
            Task { await pm.fetch() }
        }
    }
}

struct ClickChoreViewV2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClickChoreViewV2(user: exampleProfile2, chore: exampleChores[0])
        }
    }
}
