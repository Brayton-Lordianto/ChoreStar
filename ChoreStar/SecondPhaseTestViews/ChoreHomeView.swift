//
//  ChoreHomeView.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import SwiftUI

enum Classification: String, CaseIterable {
    case cleaning
    case exercise
    case more
}

struct Chore {
    let image: Image
    let name: String
    let classification: Classification
    let issuedByUser: userInfo
}

struct ChoreHomeView: View {
    @State var classification: Classification = .cleaning
    var chores: [Chore] {
        exampleChores.filter { $0.classification == classification }
    }
    
    var body: some View {
        Form {
            ForEach(chores, id: \.name) { chore in
                SingleChoreToFind(chore: chore)
            }
            .listRowBackground(Color.clear)
        }
    }
}

struct ChoreHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ChoreHomeView()
    }
}
