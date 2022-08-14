//
//  ContentView.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    var vm = PaymentManager()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Button("Pay") {
                Task { await vm.purchase() }
            }
        }
        .onAppear {
            Task { await vm.fetch() }
            sendTwilioMessage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
