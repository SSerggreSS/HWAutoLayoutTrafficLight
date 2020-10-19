//
//  ViewController.swift
//  HWAutoLayoutTrafficLight
//
//  Created by Сергей  Бей on 16.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    let trafficLight = TrafficLight(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        constraintsForTrafficLight()
    }
    
    //MARK: Define Constraint
    fileprivate func constraintsForTrafficLight() {
        view.addSubview(trafficLight)
        NSLayoutConstraint.activate(
            [trafficLight.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             trafficLight.widthAnchor.constraint(equalTo: trafficLight.heightAnchor,
                                                 multiplier: CGFloat(Constants.multiplierTrafficLight)),
             trafficLight.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.constraintTop),
             trafficLight.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }

}

