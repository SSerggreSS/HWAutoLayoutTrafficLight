//
//  LightBulb.swift
//  HWAutoLayoutTrafficLight
//
//  Created by Сергей  Бей on 19.10.2020.
//

import UIKit

class LightBulb: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        switch LightBulbColor(rawValue: self.tag) {
        case .red:
            UIColor.red.setFill()
        case .yellow:
            UIColor.yellow.setFill()
        case .green:
            UIColor.green.setFill()
        case .none:
            break
        }
        path.fill()
    }
}

enum LightBulbColor: Int {
    case red
    case yellow
    case green
}
