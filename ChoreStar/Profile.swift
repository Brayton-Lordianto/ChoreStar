//
//  Profile.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import SwiftUI

struct Profile: View {
    var user: userInfo
    var body: some View {
        //        NavigationView {
        Form {
            ProfileEmbed(user: user)
                .listRowBackground(Color.white)
        }
        .navigationTitle("Your Profile")
        //        }
    }
    
}

func ProfileEmbed(user: userInfo) -> some View {
    VStack {
        centered(view: user.img)
//            .listRowBackground(Color.clear)
        centered(view:
                    Text(user.name)
            .font(.largeTitle)
        )
//        .listRowBackground(Color.clear)
        
        centered(view:
        HStack {
            Text("\"")
//                .listRowBackground(Color.clear)
                .font(.largeTitle)
            
            
            Text(user.shortDescription)
                .font(.callout)
                .multilineTextAlignment(.center)
            
            Text("\"")
                .listRowBackground(Color.clear)
                .font(.largeTitle)
        }
     )
//        .listRowBackground(Color.clear)
        
        
        
        //                centered(view:
        Text("More details: \n\n" + user.moreDetails)
            .font(.subheadline)
        //                )
        
    }
//    .navigationTitle("Your Profile")
}

func centered(view: some View) -> some View {
    HStack {
        Spacer()
        view
        Spacer()
    }
}
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(user: exampleProfile2)
    }
}
