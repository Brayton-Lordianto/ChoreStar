//
//  FindingChoreMan.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//

import SwiftUI
import MapKit

// a view to find a chore man (in your location)
struct FindingChoreMan: View {
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    
                    ForEach(0..<5) {_ in
                        List {
                            NavigationLink {
                                Text("hi")
                            } label: {
                                SingleChoreMan(user: exampleUserInfo)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Chore Stars Near You!")
        }
    }
}

extension FindingChoreMan {
    var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion()))
        .aspectRatio(contentMode: .fit)
        .allowsHitTesting(false)
        .cornerRadius(40)
    }
}

struct FindingChoreMan_Previews: PreviewProvider {
    static var previews: some View {
            FindingChoreMan()
    }
}
