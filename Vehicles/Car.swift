//
//  Car.swift
//  Vehicles
//
//  Created by Taras on 21.03.17.
//  Copyright © 2017 Razeware, LLC. All rights reserved.
//

import Foundation


class Car: Vehicle {
  
  var isConvertible: Bool = false
  var isHatchBack: Bool = false
  var hasSunRoof: Bool = false
  var numberOfDoors: Int = 0
  
  
  override init() {
  super.init()
  numberOfWheels = 4
}
  //private method implementation
  fileprivate func start() -> String {
    return String(format: "Start power source %@", powerSource)
  }
  //superClass overrides
  override func goForward() -> String {
    return String(format: "%@ %@ Then depress gas pedal.", start(), changeGears("Forward"))
  }
  override func goBackWard() -> String {
    return String(format: "%@ %@ Check your rear view mirror. Then depress gas pedal.", start(), changeGears("Reverse"))
  }
  override func stopMoving() -> String {
    return String(format: "Depress brake pedal. %@", changeGears("Park"))
  }
  override func makeNoise() -> String {
    return "Beep Beep!"
  }
  override var vehicleDetails: String {
    //get basic details from superClass
    let basicDetails = super.vehicleDetails
    
    //initialize mutable string
    var carDetailsBuilder = "\n\nCar-specific details:\n\n"
    //string helpers for booleans
    let yes = "yes\n"
    let no = "no\n"
    
    // Add info about car-specific features.
    carDetailsBuilder += "Is Convertible: "
    carDetailsBuilder += isConvertible ? yes : no
    
    carDetailsBuilder += "Number of doors: \(numberOfDoors)"
    
    // Create the final string by combining basic and car-specific details.
    let carDetails = basicDetails + carDetailsBuilder
    
    return carDetails
  }
  
}
