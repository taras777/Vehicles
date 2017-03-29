//
//  Motorcycle.swift
//  Vehicles
//
//  Created by Taras on 21.03.17.
//  Copyright © 2017 Razeware, LLC. All rights reserved.
//

import Foundation

class Motorcycle: Vehicle {
  
  var engineNoise = ""
  
  override init() {
    super.init()
    numberOfWheels = 2
    powerSource = "gas engine"
  }
  //superclass overrides
  override func goForward() -> String {
    return String(format: "%@ Open throttle.", changeGears("Forward"))
  }
  
  override func goBackWard() -> String {
    return String(format: "%@ Walk %@ backwards using feet.", changeGears("Neutral"), modelName)
  }
  
  override func stopMoving() -> String {
    return "Squeeze brakes"
  }
  
  override func makeNoise() -> String {
    return self.engineNoise
  }
  override var vehicleDetails: String {
    //Get basic details from superclass
    let basicDetails = super.vehicleDetails
    
    //Initialize mutable string
    var motorcycleDetailsBuilder = "\n\nMotorcycle-Specific Details:\n\n"
    
    //Add info about motorcycle-specific features.
    motorcycleDetailsBuilder += "Engine Noise: \(engineNoise)"
    
    let motorcycleDetails = basicDetails + motorcycleDetailsBuilder
    
    return motorcycleDetails
  }
}
