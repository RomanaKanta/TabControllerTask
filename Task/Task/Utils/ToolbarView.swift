//
//  ToolbarView.swift
//  Task
//
//  Created by Romana on 28/9/22.
//

import Foundation
import UIKit

class ToolbarView: UIView {
    
    var pageTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.textAlignment = .center
        view.textColor = UIColor.white
        return view
    }()
    var menuBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "menu"), for: .normal)
        view.tintColor = UIColor.white
        return view
    }()
    var backBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "ic_arrow_back_white"), for: .normal)
        view.tintColor = UIColor.white
        view.isHidden = true
        return view
    }()
    var profileBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "profile"), for: .normal)
        view.tintColor = UIColor.white
        return view
    }()
    var backEmptyBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()

    var haveBack = false { didSet{ updateUI() } }
    var title = "HOME" { didSet{ updateUI() } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        setGradientBackground(colorOne: UIColor(hexString: AppConstant.APP_COLOR)!, colorTwo: UIColor(hexString: AppConstant.SECONDARY_COLOR)!)
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(menuBtn)
        stackView.addArrangedSubview(backBtn)
        stackView.addArrangedSubview(pageTitle)
        stackView.addArrangedSubview(profileBtn)
        stackView.addArrangedSubview(backEmptyBtn)
        
        addSubview(stackView)
        
        let constraints = [
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            menuBtn.heightAnchor.constraint(equalToConstant: 35),
            menuBtn.widthAnchor.constraint(equalTo: menuBtn.heightAnchor),
            
            backBtn.heightAnchor.constraint(equalTo: menuBtn.heightAnchor),
            backBtn.widthAnchor.constraint(equalTo: menuBtn.heightAnchor),
            
            profileBtn.heightAnchor.constraint(equalTo: menuBtn.heightAnchor),
            profileBtn.widthAnchor.constraint(equalTo: menuBtn.heightAnchor),
            
            backEmptyBtn.heightAnchor.constraint(equalTo: menuBtn.heightAnchor),
            backEmptyBtn.widthAnchor.constraint(equalTo: menuBtn.heightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor)  {
        
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = self.bounds
        gradientlayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientlayer.locations = [0, 1]
        gradientlayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientlayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        self.layer.insertSublayer(gradientlayer, at: 0)
    }
    
    func updateUI() {
        if(!title.isEmpty){
            pageTitle.text = title
        }
        if(haveBack){
            menuBtn.isHidden = true
            profileBtn.isHidden = true
            backBtn.isHidden = false
            backEmptyBtn.isHidden = false
        }else{
            menuBtn.isHidden = false
            profileBtn.isHidden = false
            backBtn.isHidden = true
            backEmptyBtn.isHidden = true
        }
        setNeedsDisplay()
    }
    
}

