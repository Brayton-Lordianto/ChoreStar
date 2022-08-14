//
//  SingleChoreManV2.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import SwiftUI

struct SingleChoreManV2: View {
    var user: userInfo
    var body: some View {
        
        ZStack {
            
            
            VStack {
                user.img
                    .resizable()
                    .scaledToFit()
                    .frame(height: 45)
                    .frame(width: 45)
                    .cornerRadius(100)
                
                VStack {
                    VStack(alignment: .center) {
                        Text(user.name)
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text(user.shortDescription)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "star.fill")
                                .font(.subheadline)
                                .foregroundColor(.yellow)
                            Text("4.9")
                        }
                    }
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(.green)
                    .shadow(radius: 12)
        )
//            Text("hi")
//                .clipShape(Circle())
//                .background(
//                    
//                )
//                .offset(x: 65, y:55)
        }
        
    }
}

struct SingleChoreManV2_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white
            Form {
                
                SingleChoreManV2(
                    user: exampleUserInfo
                )
                .listRowBackground(Color.clear)
            }
//            Color.white.opacity(0.2)
        }
    }
}
