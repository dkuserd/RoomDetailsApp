//
//  RoomBookingSortVC.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 22/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import Foundation
import UIKit

class RoomBookingSortVC: UIViewController {
    
    @IBOutlet weak var locationButtonOutlet: UIButton!
    @IBOutlet weak var capacityButtonOutlet: UIButton!
    @IBOutlet weak var availabilityButtonOutlet: UIButton!
    
    let uncheckedImage = (UIImage(named: RoomBookingConstants.radioButtonUnchecked) ?? UIImage.init()) as UIImage
    let checkedImage = UIImage(named: RoomBookingConstants.radioButtonChecked) ?? UIImage.init() as UIImage
    
    var isLocation: Bool = false
    var isCapacity: Bool = false
    var isAvailability: Bool = false
    
    weak var roomBookingSortDelegate: RoomBookingSortProtocol?
    
    /// Location Radio Button Action
    /// - Parameters:
    ///   - sender: sender
    ///   - event: event
    @IBAction func locationAction(_ sender: UIButton, forEvent event: UIEvent) {
        if sender == locationButtonOutlet {
            
            isLocation = !isLocation
            isCapacity = false
            isAvailability = false
            capacityButtonOutlet.setImage(uncheckedImage, for: .normal)
            availabilityButtonOutlet.setImage(uncheckedImage, for: .normal)
            if isLocation == true {
                    locationButtonOutlet.setImage(checkedImage, for: .normal)
            } else {
                    locationButtonOutlet.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    /// Capacity Radio Button Action
    /// - Parameters:
    ///   - sender: sender
    ///   - event: event
    @IBAction func capacityAction(_ sender: UIButton, forEvent event: UIEvent) {
        if sender == capacityButtonOutlet {
            isCapacity = !isCapacity
            isLocation = false
            isAvailability = false
            locationButtonOutlet.setImage(uncheckedImage, for: .normal)
            availabilityButtonOutlet.setImage(uncheckedImage, for: .normal)
            if isCapacity == true {
                    capacityButtonOutlet.setImage(checkedImage, for: .normal)
            } else {
                    capacityButtonOutlet.setImage(uncheckedImage, for: .normal)
            }
        }

    }
    
    /// Avaliability Radio Button Action
    /// - Parameters:
    ///   - sender: sender
    ///   - event: event
    @IBAction func availabilityAction(_ sender: UIButton, forEvent event: UIEvent) {
        if sender == availabilityButtonOutlet {
            isAvailability = !isAvailability
            isLocation = false
            isCapacity = false
            locationButtonOutlet.setImage(uncheckedImage, for: .normal)
            capacityButtonOutlet.setImage(uncheckedImage, for: .normal)
            if isAvailability == true {
                    availabilityButtonOutlet.setImage(checkedImage, for: .normal)
            } else {
                    availabilityButtonOutlet.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    /// Reset Button Action
    /// - Parameters:
    ///   - sender: sender
    ///   - event: event
    @IBAction func resetAction(_ sender: UIButton, forEvent event: UIEvent) {
        isLocation = false
        isCapacity = false
        isAvailability = false
        locationButtonOutlet.setImage(uncheckedImage, for: .normal)
        capacityButtonOutlet.setImage(uncheckedImage, for: .normal)
        availabilityButtonOutlet.setImage(uncheckedImage, for: .normal)
    }
    
    /// To pass delegates based on selection
    /// - Parameters:
    ///   - sender: sender
    ///   - event: event
    @IBAction func applyAction(_ sender: UIButton, forEvent event: UIEvent) {
        if isLocation {
            roomBookingSortDelegate?.sortBasedOnSelection(sortBased: RoomBookingConstants.locationSort)
        } else if isCapacity {
            roomBookingSortDelegate?.sortBasedOnSelection(sortBased: RoomBookingConstants.capacitySort)
        } else if isAvailability {
            roomBookingSortDelegate?.sortBasedOnSelection(sortBased: RoomBookingConstants.roomAvailable)
        }
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
