//
//  LoginCard.swift
//  Deadlliner
//
//  Created by Arman on 13.11.2021.
//

import UIKit
@IBDesignable
class LoginCard: UIView {
    let shapeLayer = CAShapeLayer()
    private var color = UIColor(red: 234, green: 193, blue: 15, alpha: 100)
    private var size = CGSize()
    
    
    
    @IBInspectable var cornerRadiiSize: CGFloat = 0 {
        didSet {
            size = CGSize(width: cornerRadiiSize, height: cornerRadiiSize)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.mask = shapeLayer
    }
    
    
    
    var path: UIBezierPath?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.allCorners], cornerRadii: size).cgPath
        color.setFill()
        path?.fill()
        
    }
    

}
