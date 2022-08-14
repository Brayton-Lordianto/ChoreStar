//
//  ClickChoreView.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import SwiftUI

struct ClickChoreView: View {
    @Environment(\.presentationMode) var presentationMode
    var pm = PaymentManager()
    var user: userInfo // the user that will get the money
    var chore: Chore
    var body: some View {
        Form {
            // add name of user
            Section("volunteer who helped") {
                
                HStack {
                    Spacer()
                    user.img
                        .resizable()
                        .frame(height: 125)
                        .aspectRatio(1.0, contentMode: .fit)
                    Spacer()
                }
                .listRowBackground(Color.clear)
                Text(user.name)
            }
            
            // select payment or not
            Button("Give a $0.99 Tip to John Doe") {
                Task {
                    await pm.purchase()
                    exampleChores[0].isCompleted = true
                    presentationMode.wrappedValue.dismiss()
                }
            }
            Button("Don't Give Tip") {
                exampleChores[0].isCompleted = true
                presentationMode.wrappedValue.dismiss()
            }
            .navigationTitle("Complete Chore")
        }
        .onAppear {
            Task { await pm.fetch() }
        }
    }
}

struct ClickChoreView_Previews: PreviewProvider {
    static var previews: some View {
        ClickChoreView(user: exampleProfile2, chore: exampleChores[0])
    }
}
