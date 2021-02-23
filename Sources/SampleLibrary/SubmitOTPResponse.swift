//
//  File.swift
//  
//
//  Created by E0102 on 23/02/21.
//


import Foundation
struct SubmitOTPResponse: Codable, CustomStringConvertible {
    var secKey: String?
    var mobileNumber: String?
    var defString = String(stringLiteral: "")
    
    var description: String {
        return """
        secKey = \(secKey ?? defString)
        mobieNumber = \(mobileNumber ?? defString)
        """
    }

}
