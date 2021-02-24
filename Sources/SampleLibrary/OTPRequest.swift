//
//  File.swift
//  
//
//  Created by E0102 on 23/02/21.
//

import Foundation


public class OTPRequest {
    
//    public let userId: String
//    public let GCIF: String
////    public var email:String
//    public let mobileNumber:String

    let rest = RestManager()
    var otpResult = OTPResponse()
   

//    public init(userId: String, GCIF: String,email:String,mobileNumber:String) {
//        self.userId = userId
//        self.GCIF = GCIF
//        self.email = email
//        self.mobileNumber = mobileNumber
//
//    }
    
   func otpAPI(userId:String,GCIF:String,mobileNumber:String) -> OTPResponse
    {
//    self.userId = userId
//    self.GCIF = GCIF
//    self.mobileNumber = mobileNumber
       
    let url = URL(string: APIConstants.BASEURL+"/userverification")!
        
        rest.requestHttpHeaders.add(value: "application/json", forKey: "Content-Type")
        rest.httpBodyParameters.add(value: userId, forKey: "userId")
        rest.httpBodyParameters.add(value: GCIF, forKey: "GCIF")
        rest.httpBodyParameters.add(value: mobileNumber, forKey: "mobileNumber")
        
        rest.makeRequest(toURL: url, withHttpMethod: .post) { [self] (results) in
            guard let response = results.response else { return }
            if response.httpStatusCode == 201 {
                guard let data = results.data else { return }
               let decoder = JSONDecoder()
               guard let otpResponse = try? decoder.decode(OTPResponse.self, from: data) else { return
               }
                self.otpResult = otpResponse
                print(self.otpResult.description)
                //self.email = otpResult.email ?? ""
                //self.mobileNumber = otpResult.mobileNumber ?? ""
               
               
            }
        }
    return self.otpResult
       
    }
    
    

}
