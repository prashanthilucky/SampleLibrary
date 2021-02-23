//
//  File.swift
//  
//
//  Created by E0102 on 23/02/21.
//

import Foundation
struct OTPResponse: Codable, CustomStringConvertible {
    var email: String?
    var mobileNumber: String?
    var defString = String(stringLiteral: "")
    
    var description: String {
        return """
        email = \(email ?? defString)
        name = \(mobileNumber ?? defString)
        """
    }

}
