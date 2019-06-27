//
//  NetworkLayer.swift
//  Arduino-Remote
//
//  Created by timofey makhlay on 6/27/19.
//  Copyright © 2019 Timofey Makhlay. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager {
    let urlString = "http://127.0.0.1:5000/ios/"
    
    func getSensorStatus() -> Bool {
        var status: String = "" {
            didSet {
                if status == "0" {
                    // Stop spinning rocket
                }
                else if status == "1" {
                    // Start spinning rocket
                }
            }
        }
        // Get sensor status
        Alamofire.request(urlString + "sensor", method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                print("response: ", response)
                switch response.result {
                    
                case .success(let json):
                    print("Sensor Response:",json)
                    DispatchQueue.main.async {
                        
                        // handle your code
                        
                    }
                case .failure(let error):
                    print("Sensor Failiure:",error)
                }
        }
        
        return false
    }
    
    func postMotorStatus(status: String) {
        // Post network status
        Alamofire.request(urlString + "motor", method: .post, parameters: ["status": status],encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print("Success Response:",response)
                
                break
            case .failure(let error):
                print("Failure Response:",error)
            }
        }
    }
}
