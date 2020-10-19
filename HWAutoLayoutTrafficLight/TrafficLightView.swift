//
//  TrafficLightView.swift
//  HWAutoLayoutTrafficLight
//
//  Created by Сергей  Бей on 16.10.2020.
//

import UIKit

class TrafficLight: UIView {

    let lightBulbs = (red: LightBulb.createWith(nil, false, tag: 0),
                      yellow: LightBulb.createWith(nil, false, tag: 1),
                      green: LightBulb.createWith(nil, false, tag: 2))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        self.backgroundColor = .black
        self.translatesAutoresizingMaskIntoConstraints = false
        layoutRedBulb()
        layoutYellowBulb()
        layoutGreenBulb()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func layoutRedBulb() {
        self.addSubview(lightBulbs.red)
        
        NSLayoutConstraint.activate(
            [lightBulbs.red.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             lightBulbs.red.heightAnchor.constraint(equalTo: self.heightAnchor,
                                                    multiplier: Constants.multiplierLightBulb),
             lightBulbs.red.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.constraintTop),
             lightBulbs.red.widthAnchor.constraint(equalTo: lightBulbs.red.heightAnchor)
            ])
    }
    
    fileprivate func layoutYellowBulb() {
        self.addSubview(lightBulbs.yellow)
        
        NSLayoutConstraint.activate(
            [lightBulbs.yellow.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             lightBulbs.yellow.heightAnchor.constraint(equalTo: lightBulbs.red.heightAnchor),
             lightBulbs.yellow.widthAnchor.constraint(equalTo: lightBulbs.yellow.heightAnchor),
             lightBulbs.yellow.topAnchor.constraint(equalTo: lightBulbs.red.bottomAnchor, constant: Constants.constraintTop)
            ])
    }
    
    fileprivate func layoutGreenBulb() {
        self.addSubview(lightBulbs.green)
        NSLayoutConstraint.activate(
            [lightBulbs.green.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             lightBulbs.green.heightAnchor.constraint(equalTo: lightBulbs.yellow.heightAnchor),
             lightBulbs.green.widthAnchor.constraint(equalTo: lightBulbs.green.heightAnchor),
             lightBulbs.green.topAnchor.constraint(equalTo: lightBulbs.yellow.bottomAnchor, constant: Constants.constraintTop)
            ])
    }
    
}

extension LightBulb {
    static func createWith(_ backgroundColor: UIColor?, _ autoResizingMaskTranslate: Bool, tag: Int) -> UIView {
        let lightBalb = LightBulb()
            lightBalb.backgroundColor = backgroundColor
            lightBalb.translatesAutoresizingMaskIntoConstraints = autoResizingMaskTranslate
            lightBalb.tag = tag
        return lightBalb
    }
}
