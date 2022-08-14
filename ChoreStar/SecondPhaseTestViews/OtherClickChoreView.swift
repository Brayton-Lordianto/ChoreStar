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
    var body: some View {
        Form {
            Button("Accept") {
                exampleChores[0].receivedByUser = true
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct OtherClickChoreView_Previews: PreviewProvider {
    static var previews: some View {
        OtherClickChoreView()
    }
}
