//
//  TwilioUtility.swift
//  ChoreStar
//
//  Created by Brayton Lordianto on 8/14/22.
//

import Foundation
import Alamofire


func sendMessage(_ msg: String = "Hello from Swift!") {
    if let accountSID = ProcessInfo.processInfo.environment["TWILIO_ACCOUNT_SID"],
       let authToken = ProcessInfo.processInfo.environment["TWILIO_AUTH_TOKEN"] {
        
        let url = "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages"
        let parameters = ["From": "+19179207044", "To": "+6598937196", "Body": msg]
        
        AF.request(url, method: .post, parameters: parameters)
            .authenticate(username: accountSID, password: authToken)
            .responseString { response in
                print("HI THERE")
                debugPrint(response)
            }
        
        RunLoop.main.run()
    }
}
