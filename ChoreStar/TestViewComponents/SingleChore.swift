//
//  SingleChore.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import SwiftUI

struct SingleChore: View {
    var user: userInfo
    @State var chosen: Binding<Bool>
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                Text(user.shortDescription)
                    .font(.subheadline)
            }
            Spacer()
//            
//            if chosen.wrappedValue {
//                Image(systemName: "checkmark")
//                    .foregroundColor(.green)
//            }
        }
        .padding(10)
        .onTapGesture {
            chosen.wrappedValue.toggle()
        }
    }
}

struct SingleChore_Previews: PreviewProvider {
    static var b = false
    static var previews: some View {
        SingleChore(user: exampleUserInfo, chosen: .constant(true))
    }
}
