//
//  RoomBookingInteractor.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 21/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import Foundation

class RoomBookingInteractor: RoomBookingInteractorProtocol {
    
    var moduleInteractor: RoomBookingStoreProtocol = RoomBookingStore()
    var modulePresenter: RoomBookingPresenterProtocol?
    
    /// To fetch and present room details
    /// - Parameter serviceUrl: servieUrl
    func fetchRoomsDetailsList(serviceUrl: String) {
        moduleInteractor.fetchRoomsDetailsList(serviceUrl: serviceUrl,
                                               success: { (roomDetailsWithError) in
                                                
                                                self.modulePresenter?.presentFetchedRoomsDetailsList(roomsDetails: roomDetailsWithError)
                                                
        })
        { (roomDetailsWithError) in
            self.modulePresenter?.presentFetchedRoomsDetailsList(roomsDetails: roomDetailsWithError)
        }
    }
}
