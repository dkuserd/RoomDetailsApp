//
//  NetworkReachability.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 22/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import Foundation
import SystemConfiguration

class NetworkReachability {
    /// To determine network connectivity
    /// - Returns: description
    class func isConnectedToNetwork() -> Bool {
        
        var zeroSockAddr = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroSockAddr.sin_len = UInt8(MemoryLayout.size(ofValue: zeroSockAddr))
        zeroSockAddr.sin_family = sa_family_t(AF_INET)
        
        let networkReachability = withUnsafePointer(to: &zeroSockAddr) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddr in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddr)
            }
        }
        
        var scFlags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(networkReachability!, &scFlags) == false {
            return false
        }
        
        let isCWReachable = (scFlags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let requestConnection = (scFlags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let concat = (isCWReachable && requestConnection)
        
        return concat
    }
}
