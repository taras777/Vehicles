//
//  DetailViewController.swift
//  Vehicles
//
//  Created by Ray Fix on 9/8/14.
//  Copyright (c) 2014 Razeware, LLC. All rights reserved.
//

import UIKit

class VehicleDetailViewController: UIViewController {
  
  @IBOutlet weak var detailDescriptionLabel: UILabel!
  
  var detailVehicle: Vehicle? {
    didSet {
      // Update the view.
      self.configureView()
    }
  }

  func configureView() {
    // Update the user interface for the detail item.
    if let vehicle = detailVehicle {
      title = vehicle.vehicleTitle
      detailDescriptionLabel?.text = vehicle.vehicleDetails
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }

  @IBAction func goForward(_ sender: AnyObject) {
    if let vehicle = detailVehicle {
    let controller = UIAlertController.alertControllerWithTitle(title: "Go Forward!", message: vehicle.goForward())
    present(controller, animated: true) {}
    
    }
  }
  
  @IBAction func goBackward(_ sender: AnyObject) {
    if let vehicle = detailVehicle {
      let controller = UIAlertController.alertControllerWithTitle(title: "Go Backward!", message: vehicle.goBackWard())
      present(controller, animated: true) {}
    }
  }
  
  @IBAction func stopMoving(_ sender: AnyObject) {
    if let vehicle = detailVehicle {
      let controller = UIAlertController.alertControllerWithTitle(title: "Stop Moving!", message: vehicle.stopMoving())
      present(controller, animated: true) {}
    }
  }
  
  @IBAction func turn(_ sender: AnyObject) {
    if let vehicle = detailVehicle {
      let controller = UIAlertController.alertControllerWithNumberInput(title: "Turn!", message: "Enter number of degrees to turn:", buttonTitle: "Go!") {
        integerValue in
        if let value = integerValue {
          let controller = UIAlertController.alertControllerWithTitle(title: "Turn", message: vehicle.turn(value))
          self.present(controller, animated: true, completion: nil)
        }
      }
      present(controller, animated: true, completion: nil)
    }
  }
  
  @IBAction func makeNoise(_ sender: AnyObject) {
    if let vehicle = detailVehicle {
      let controller = UIAlertController.alertControllerWithTitle(title: "Make Noise!", message: vehicle.makeNoise())
      present(controller, animated: true) {}
    }
  }
  
}
