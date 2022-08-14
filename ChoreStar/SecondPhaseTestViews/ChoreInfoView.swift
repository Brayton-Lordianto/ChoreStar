//
//  ChoreInfoView.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import SwiftUI

struct ChoreInfoView: View {
    var chore: Chore
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ChoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ChoreInfoView(chore: exampleChores[0])
    }
}
