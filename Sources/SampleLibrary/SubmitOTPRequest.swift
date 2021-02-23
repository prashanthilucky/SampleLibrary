//
//  File.swift
//  
//
//  Created by E0102 on 23/02/21.
//

import Foundation

public class SubmitOTPRequest
{
    public let userId: String
    public let GCIF: String
    public let otp :String
   // public var mobileNumber:String

        let rest = RestManager()
        var sumbitResponse = SubmitOTPResponse()
       

    //    public init(userId: String, GCIF: String,email:String,mobileNumber:String) {
    //        self.userId = userId
    //        self.GCIF = GCIF
    //        self.email = email
    //        self.mobileNumber = mobileNumber
    //
    //    }
        
    public init (userId:String,GCIF:String,otp:String)
      {
      self.userId = userId
      self.GCIF = GCIF
      self.otp = otp
          
      guard let url = URL(string: APIConstants.BASEURL+"/userverification") else { return }
          
          rest.requestHttpHeaders.add(value: "application/json", forKey: "Content-Type")
          rest.httpBodyParameters.add(value: userId, forKey: "userId")
          rest.httpBodyParameters.add(value: GCIF, forKey: "GCIF")
          rest.httpBodyParameters.add(value: otp, forKey: "mobileNumber")
          
          rest.makeRequest(toURL: url, withHttpMethod: .post) { [self] (results) in
              guard let response = results.response else { return }
              if response.httpStatusCode == 201 {
                  guard let data = results.data else { return }
                 let decoder = JSONDecoder()
                 guard let otpResponse = try? decoder.decode(SubmitOTPResponse.self, from: data) else { return
                 }
                  self.sumbitResponse = otpResponse
                  print(self.sumbitResponse.description)
                  //self.email = otpResult.email ?? ""
                  //self.mobileNumber = otpResult.mobileNumber ?? ""
                 
                 
              }
          }
          
         
      }

    }


