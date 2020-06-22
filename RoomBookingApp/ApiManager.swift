//
//  ApiManager.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 21/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import Foundation

class ApiManager {
    func fetchRoomsDetailsList(serviceUrl: String,
                               completionHandler: @escaping([RoomDetails]?, Error?) -> Void) {
        
        guard let url = URL(string: serviceUrl) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            guard let data = data else { return }
            do {
                let jsonDecoder = try JSONDecoder().decode([RoomDetails].self, from: data)
                completionHandler(jsonDecoder, nil)
                
            } catch let jsonDecoderError {
                print("error decoding all room details")
                completionHandler(nil, jsonDecoderError)
            }
        }.resume()
    }
}
