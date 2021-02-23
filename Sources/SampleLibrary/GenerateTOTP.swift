
import Foundation
import SwiftOTP
import CryptoSwift


public class GenerateTOTP:NSObject {
   
   
    var encryptedValue:[UInt8]!
    
  public func generateTOTP(someKey:String)-> String
    {
    
    let key = "3WjP+CXNL1D/DrL1poIHu4M+1gLwyVmNNk2KxMLIdG0="
    let iv = "tzeYaJkxXcBNXuWUtpPISw=="
   // let somekey = "wdjbcwkjc"
        
     if let aes = try? AES(key: key, iv: iv),
            let aesE = try? aes.encrypt(Array(someKey.utf8)) {
            print("AES encrypted: \(aesE)")
         self.encryptedValue = aesE
            let aesD = try? aes.decrypt(aesE)
            let decrypted = String(bytes: aesD!, encoding: .utf8)
            print("AES decrypted: \(decrypted)")
        }
        let secretString = self.encryptedValue.toBase64()
        
        let secretData = (secretString?.data(using: .utf8))!
        
       let tOtp =  TOTP(secret: secretData, digits: 6, timeInterval: 30, algorithm: .sha1)
        
        let pin = (tOtp?.generate(time:Date()))!
        
        return pin
        
    
    }
}

//extension String {
//    func aesEncrypt(key: String, iv: String) throws -> String{
//        let encrypted = try AES(key: key, iv: iv, padding: .pkcs7).encrypt([UInt8](self.data(using: .utf8)!))
//            return Data(encrypted).base64EncodedString()
//
//    }
//
//    func aesDecrypt(key: String, iv: String) throws -> String {
//        guard let data = Data(base64Encoded: self) else { return "" }
//           let decrypted = try AES(key: key, iv: iv, padding: .pkcs7).decrypt([UInt8](data))
//           return String(bytes: decrypted, encoding: .utf8) ?? self
//    }
//
//
//}
//
