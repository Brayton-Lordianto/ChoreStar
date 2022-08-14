//
//  ChooseChoreView.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/13/22.
//
//
import SwiftUI

let exampleChore = userInfo(img: Image(""), name: "Walk me home", shortDescription: "From Marina Bay Sands to Orchard Road", moreDetails: "")

struct ChooseChoreView: View {
    var pm = PaymentManager()
    @State var bind = false
    var body: some View {
        Form {
            
            HStack(alignment: .center) {
                Spacer()
                Text("Show your thanks with an affordable, $1 tip!")
                    .font(.title3)
                    .italic()
                Spacer()
            }
            .listRowBackground(Color.clear)
                
            Section("your open tasks") {
                Text("Which chore do you want to mark off?")
                    .font(.subheadline)
                List {
                    single
    //                    Button {
    //
    //                    } label: {
    //                        SingleChore(user: exampleChore, chosen: $bind)
    //                    }
    //                    .foregroundColor(.black)
                }
            }
            
            Section {
                Button("Give a $0.99 Tip to John Doe") {
                    Task {
                        await pm.purchase()
                    }
                }
                .disabled(!bind)
                
            }
        }
//        .navigationTitle("")
        .onAppear {
            Task {await pm.fetch()}
        }
    }
}

extension ChooseChoreView {
    var single: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(exampleChore.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                Text(exampleChore.shortDescription)
                    .font(.subheadline)
            }
            Spacer()

            if bind {
                Image(systemName: "checkmark")
                    .foregroundColor(.green)
            }
        }
        .padding(10)
        .onTapGesture {
            bind.toggle()
        }

    }
}

struct ChooseChoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChooseChoreView()
        }
    }
}
