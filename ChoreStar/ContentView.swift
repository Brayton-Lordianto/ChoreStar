//
//  ContentView.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    var vm = ViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Button("Pay") {
                Task { await vm.purchase(tag: "testProduct2") }
            }
        }
        .onAppear {
            Task { await vm.fetch() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
