//
//  exampleChores.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import Foundation
import SwiftUI

let thirdExampleUser = userInfo(img: Image("user3"), name: "Jimmy Fallon", shortDescription: "I need people to help me with my chores", moreDetails: "NA")

let exampleChores = [
    Chore(image: Image("1"), name: "Collect Garbage", classification: .cleaning, issuedByUser: thirdExampleUser),
    Chore(image: Image("2"), name: "Clean the Cabinet", classification: .cleaning, issuedByUser: thirdExampleUser),
    Chore(image: Image("3"), name: "Walk me Home", classification: .exercise, issuedByUser: thirdExampleUser),
    Chore(image: Image("4"), name: "Yoga Class", classification: .exercise, issuedByUser: thirdExampleUser),
    Chore(image: Image("5"), name: "Aerobics", classification: .exercise, issuedByUser: thirdExampleUser)
]
