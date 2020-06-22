//
//  ViewController.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 19/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import UIKit

class RoomBookingVC: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, RoomBookingViewProtocol, RoomBookingSortProtocol {
    
    @IBOutlet weak var dateTFOutlet: UITextField!
    
    @IBOutlet weak var timeTFOutlet: UITextField!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    
    @IBOutlet weak var sortButtonOutlet: UIButton!
    var moduleInteractor: RoomBookingInteractorProtocol?
    
    var allRoomsDetails: [RoomDetailsSingle]?
    var hourMin: String = ""
    
    /// Initial setup
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setup()
                
        timeTFOutlet.inputView = datePickerOutlet
        dateTFOutlet.inputView = datePickerOutlet
        
        datePickerOutlet.isHidden = true
        datePickerOutlet.minuteInterval = RoomBookingConstants.minuteInterval
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.height, height: 40))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneTapped(_:)))
        toolBar.setItems([doneButton], animated: true)
        self.dateTFOutlet.inputAccessoryView = toolBar
        self.timeTFOutlet.inputAccessoryView = toolBar
        
        let roomBookingTVCell = UINib(nibName: "RoomBookingTVCell", bundle: nil)
        tableViewOutlet.register(roomBookingTVCell, forCellReuseIdentifier: RoomBookingConstants.roomBookingTVCellIdentifier)
        
        sortButtonOutlet.contentHorizontalAlignment = .right
        sortButtonOutlet.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    /// To set delegate and VIP protocols
    private func setup() {
        let viewController = self
        dateTFOutlet.delegate = viewController
        timeTFOutlet.delegate = viewController
        tableViewOutlet.delegate = viewController
        tableViewOutlet.dataSource = viewController

        let interactor = RoomBookingInteractor()
        let presenter = RoomBookingPresenter()
        
        viewController.moduleInteractor = interactor
        interactor.modulePresenter = presenter
        presenter.roomBookingVC = viewController
                
        sortButtonOutlet.addTarget(self, action: #selector(showSortVC), for: .touchUpInside)
    }
    
    /// To show sort viewcontroller
    @objc func showSortVC() {
        if allRoomsDetails != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let sortVC = storyboard.instantiateViewController(withIdentifier: "RoomBookingSortVC") as! RoomBookingSortVC
            self.present(sortVC, animated: true, completion: nil)

            sortVC.roomBookingSortDelegate = self
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        datePickerOutlet.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRoomsDetails?.count ?? RoomBookingConstants.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: RoomBookingConstants.roomBookingTVCellIdentifier, for: indexPath) as! RoomBookingTVCell
        if let allRoomsDetailsUnwrapped = allRoomsDetails {
            cell.hotelNameOutlet.text = allRoomsDetailsUnwrapped[indexPath.row].hotelName
            cell.hotelLevelOutlet.text = allRoomsDetailsUnwrapped[indexPath.row].level
            cell.hotelCapacityOutlet.text = "\(allRoomsDetailsUnwrapped[indexPath.row].capacityInt)" + RoomBookingConstants.roomPassenger
            hotelAvailablityLabelSetter(cell: cell, indexPath: indexPath, allRoomsDetailsUnwrapped: allRoomsDetailsUnwrapped)
        }
        
        return cell
    }
    
    /// To show error when fetched
    /// - Parameter roomsDetailsViewModel: roomsDetailsViewModel
    func errorFetchedRoomsDetails(roomsDetailsViewModel: RoomsDetailsViewModel) {
        
    }
    
    /// To fetch room details from response
    /// - Parameter roomsDetailsViewModel: roomsDetailsViewModel
    func successFetchedRoomsDetails(roomsDetailsViewModel: RoomsDetailsViewModel) {
        allRoomsDetails = roomsDetailsViewModel.allRoomsDetails
        DispatchQueue.main.async {
            self.tableViewOutlet.reloadData()
        }
    }
    
    /// UIDatePicker Done Method
    /// - Parameter sender: sender
    @objc func doneTapped(_ sender: UIBarButtonItem) {
        /// To make api call to fetch rooms details list
            moduleInteractor?.fetchRoomsDetailsList(serviceUrl: ServiceApiKeys.serviceUrl)
        /// To dismiss datePickerOutlet
        dateTFOutlet.resignFirstResponder()
        timeTFOutlet.resignFirstResponder()
    }
    
    /// To sort items based on selection in sort vc
    /// - Parameter sortBased: sortBasedValues Available, Capacity, Location
    func sortBasedOnSelection(sortBased: String) {
        if sortBased == RoomBookingConstants.locationSort {
            allRoomsDetails?.sort{ ($0.level < $1.level) }
        } else if sortBased == RoomBookingConstants.capacitySort {
            allRoomsDetails?.sort{ ($0.capacityInt < $1.capacityInt) }
        } else if sortBased == RoomBookingConstants.roomAvailable {
            allRoomsDetails?.sort{ ($0.capacity > $1.capacity) }
        }
            self.tableViewOutlet.reloadData()
    }
    
    /// To show UIDatePicker
    /// - Parameters:
    ///   - sender: sender
    ///   - event: event
    @IBAction func datePickerAction(_ sender: UIDatePicker, forEvent event: UIEvent) {
        
        dateTFOutlet.text = "\(sender.date.getFormattedDate().day) \(sender.date.getFormattedDate().month) \(sender.date.getFormattedDate().year)"
        
        timeTFOutlet.text = "\(sender.date.getFormattedDate().hourMinSuffix)"
        
        hourMin = sender.date.getFormattedDate().hourMin
    }
    
    
    /// To show camera
    /// - Parameter sender: sender
    @IBAction func cameraAction(_ sender: UIBarButtonItem) {
        let showCamera: RoomBookingQRScanner = RoomBookingQRScanner()
        navigationController?.pushViewController(showCamera, animated: true)
    }
}

