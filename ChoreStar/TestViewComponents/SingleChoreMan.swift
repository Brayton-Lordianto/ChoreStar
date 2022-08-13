//
//  SingleChoreMan.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import SwiftUI

struct userInfo {
    let img: Image
    let name: String
    let shortDescription: String
    let moreDetails: String
}

let exampleUserInfo = userInfo(img: Image(systemName: "person.circle.fill"), name: "John Doe", shortDescription: "My name is not Jeff", moreDetails: "Some more details about me.")

struct SingleChoreMan: View {
    var user: userInfo
    var body: some View {
        HStack {
            user.img
                .resizable()
                .scaledToFit()
                .frame(height: 45)
                .frame(width: 45)
                .cornerRadius(100)
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(user.shortDescription)
                    .font(.subheadline)
            }

        }
    }
}

struct SingleChoreMan_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            Color.yellow
            SingleChoreMan(
                user: exampleUserInfo
            )
        }
    }
}
