//
//  ChoreManFullView.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import SwiftUI

// view of a single choreman when selected by the chore clients.
// can view their details
// can request for help on chore
// can tip for finishing a chore
struct ChoreManFullView: View {
    var user: userInfo
    @State var showingSheet = false
    var body: some View {
        Form {
            VStack {
                Text("Hi, I'm " + user.name)
                    .font(.largeTitle)
                    .bold()
                
                Text("detals: ...")
                
            }
            Button {
                showingSheet.toggle()
            } label: {
                Text("Jo")
            }
            
        }
        .sheet(isPresented: $showingSheet) {
            ChooseChoreView()
        }
    }
}

struct ChoreManFullView_Previews: PreviewProvider {
    static var previews: some View {
        ChoreManFullView(user: exampleUserInfo)
    }
}
