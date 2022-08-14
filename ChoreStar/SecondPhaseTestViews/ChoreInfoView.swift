//
//  ChoreInfoView.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import SwiftUI

struct ChoreInfoView: View {
    var chore: Chore
    var v1 = true
    @Environment(\.presentationMode) var pm
    @State var showingSheet = false

    var body: some View {
        ScrollView {
            VStack {
                chore.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width + 200, height: 500)
                    .clipped()
                
                VStack {
                    Text(chore.name)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Issued By: " + chore.issuedByUser.name)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            showingSheet = true
                        }
                    
                    Divider()
                    
                    Text(chore.description)
                        .foregroundColor(.secondary)
                        .padding()
                }
                
                acceptChoreButton

            }
        }
        .sheet(isPresented: $showingSheet) {
            NavigationView {
                Profile(user: exampleProfile1)
                    .toolbar {
                        HStack {
                            Image("phone.fill")
                            Button("Contact") {}
                        }
                    }
            }
        }

        .overlay(alignment: .topLeading) {
            backButton
                .offset(x: 140, y:80)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

extension ChoreInfoView {
    
    
    var acceptChoreButton: some View {
        Button {
            Task {
                sendTwilioMessage("Jimmy Fallon has just offered his help for your chore: \(chore.name)")
            }
        } label: {
            Rectangle()
                .frame(width: 300, height: 50)
                .foregroundColor(.green)
                .cornerRadius(13)
                .overlay(
                    Text("Accept Task")
                        .foregroundColor(.white)
                )
        }
    }
    
    var backButton: some View {
        Button {
            pm.wrappedValue.dismiss()
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(.primary)
        }
        .font(.headline)
        .padding()
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 4)
    }
}

struct ChoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ChoreInfoView(chore: exampleChores[0])
    }
}
