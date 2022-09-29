//
//  CardView.swift
//  Task
//
//  Created by Romana on 28/9/22.
//

import UIKit

@IBDesignable class CardView: UIView {
    
    @IBInspectable var cornerradius: CGFloat = 5.0 { didSet{ updateUI() } }
    @IBInspectable var setPrimColorBg: Bool = false { didSet{ updateUI() } }
    @IBInspectable var bgColor: UIColor = UIColor.white { didSet{ updateUI() } }
    @IBInspectable var isGradient: Bool = false { didSet{ updateUI() } }
    @IBInspectable var startColor: UIColor = UIColor(hexString: AppConstant.APP_COLOR)! { didSet{ updateUI() } }
    //    @IBInspectable var midColor: UIColor? = nil { didSet{ updateUI() } }
    @IBInspectable var endColor: UIColor = UIColor(hexString: AppConstant.APP_COLOR)! { didSet{ updateUI() } }
    
    var shadowOffSetWidth : CGFloat = 0
    var shadowOffSetHeight : CGFloat = 4 { didSet{ updateUI() } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initCustomView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initCustomView()
    }
    
    func initCustomView() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
    }
    
    override func layoutSubviews() {
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        updateUI()
    }
    
    func updateUI() {
        
        layer.cornerRadius = cornerradius
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
               
        if (isGradient){
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = bounds
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            gradientLayer.shadowPath = shadowPath.cgPath
            layer.insertSublayer(gradientLayer, at: 0)
            
        }else{
            if (setPrimColorBg) {
                self.backgroundColor = UIColor(hexString: AppConstant.APP_COLOR)!
            }else{
                self.backgroundColor = bgColor
            }
            layer.shadowPath = shadowPath.cgPath
        }
        
         setNeedsDisplay()
    }
    
}

