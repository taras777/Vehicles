//
//  MasterViewController.swift
//  Vehicles
//
//  Created by Ray Fix on 9/8/14.
//  Copyright (c) 2014 Razeware, LLC. All rights reserved.
//

import UIKit

class VehicleListTableViewController: UITableViewController {
  
  var vehicles:[Vehicle] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupVehicleArray()
    title = "Vehicles"
  }
  //data setup
  func setupVehicleArray() {
    //clear the array. Start from scratch.
    vehicles.removeAll(keepingCapacity: true)
    
    //Create a car.
    var mustang = Car()
    mustang.brandName = "Ford"
    mustang.modelName = "Mustang"
    mustang.modelYear = 1968
    mustang.isConvertible = true
    mustang.numberOfDoors = 2
    mustang.powerSource = "gas engine"
    
    //add it to the array
    vehicles.append(mustang)
    
    // Create another car.
    var outback = Car()
    outback.brandName = "Subaru"
    outback.modelName = "Outback"
    outback.modelYear = 1999
    outback.isConvertible = false
    outback.numberOfDoors = 5
    outback.powerSource = "gas engine"
    
    //add it to the array
    vehicles.append(outback)
    
    // Create another car
    var prius = Car()
    prius.brandName = "Toyota"
    prius.modelName = "Prius"
    prius.modelYear = 2002
    prius.isConvertible = false
    prius.numberOfDoors = 4
    prius.powerSource = "hybrid engine"
    
    //add it to the array
    vehicles.append(prius)
    
    // Create a motorcycle
    var harley = Motorcycle()
    harley.brandName = "Harley-Davidson"
    harley.modelName = "Softail"
    harley.modelYear = 1979
    harley.engineNoise = "Vrrrrrrrroooooooooom!"
    
    //add it to the array
    vehicles.append(harley)
    
    // Create another motorcycle
    var kawasaki = Motorcycle()
    kawasaki.brandName = "Kawasaki"
    kawasaki.modelName = "Ninja"
    kawasaki.modelYear = 2005
    kawasaki.engineNoise = "Neeeeeeeeeeeeeeeeow!"
    
    //add it to the array
    self.vehicles.append(kawasaki)
    
    //sort the array by the models
    vehicles.sorted {
      $0.modelYear < $1.modelYear
    }
  }
  
  
  // MARK: - Segues
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if let indexPath = self.tableView.indexPathForSelectedRow {
        let vehicle = vehicles[indexPath.row]
        (segue.destination as! VehicleDetailViewController).detailVehicle = vehicle
      }
    }
  }
  
  // MARK: - Table View
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vehicles.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
    
    let vehicle = vehicles[indexPath.row] as Vehicle
    cell.textLabel?.text = vehicle.vehicleTitle
    return cell
  }
}

