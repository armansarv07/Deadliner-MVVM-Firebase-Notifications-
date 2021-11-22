//
//  LoginButton.swift
//  Deadlliner
//
//  Created by Arman on 13.11.2021.
//

import UIKit

@IBDesignable
class LoginButton: UIButton {
    private var cornerRadii: CGSize = CGSize()
    
    @IBInspectable var shadowOpacity: Float = 1 {
        didSet{
            self.layer.shadowOpacity = shadowOpacity / 100
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 10 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            cornerRadii = CGSize(width: cornerRadius, height: cornerRadius)
        }
    }
    
    @IBInspectable var shadowOffsetHeight: CGFloat = 0 {
        didSet {
            self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        }
    }
    
    @IBInspectable var shadowOffsetWidth: CGFloat = 0 {
        didSet {
            self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        }
    }
    
    @IBInspectable var color: UIColor = .blue
    var path: UIBezierPath?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
//        self.layer.shadow
        
       
        path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: cornerRadii)
        color.setFill()
        path?.fill()
    }
}
