//
//  SingleChoreToFind.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import SwiftUI

struct SingleChoreToFind: View {
    var chore: Chore
    var body: some View {
        VStack {
            chore.image
                .resizable()
//                .scaledToFill()
                .frame(width: 125, height: 250)
                .frame(maxWidth: 225, maxHeight: 225)
//                .aspectRatio(1.0, contentMode: .fit)
            Text(chore.name)
                .fontWeight(.bold)
                .font(.title3)
                .padding(.top)
        }
    }
}

struct SingleChoreToFind_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            SingleChoreToFind(chore: exampleChores[0])
            SingleChoreToFind(chore: exampleChores[1])
        }
    }
}
