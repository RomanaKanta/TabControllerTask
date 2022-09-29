//
//  CollectionViewCell.swift
//  Task
//
//  Created by Romana on 28/9/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell{
    
    var bgView: CardView = {
        let view = CardView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var cellTag: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "heart")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .gray
        return view
    }()
    var cellImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "placeholder")
        view.contentMode = .scaleToFill
        return view
    }()
    var cellTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 2
        view.adjustsFontSizeToFitWidth = false
        view.lineBreakMode = .byTruncatingTail
        view.font = UIFont.boldSystemFont(ofSize: 13)
        view.textColor = UIColor(hexString: "#0C022FFF")
        return view
    }()
    var cellPrice: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 14)
        view.textColor = UIColor(hexString: "#B0345DFF")
        return view
    }()
    var cellPrevPrice: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 12)
        view.textColor = UIColor(hexString: "#FFAFB4FF")
        view.attributedText = "$300".strikeThrough()
        return view
    }()
    var cellRate: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 14)
        view.backgroundColor = UIColor(hexString: "#B0345DFF")
        view.layer.cornerRadius = 8
        view.textColor = .white
        view.layer.masksToBounds = true
        return view
    }()
        
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        
        addSubview(bgView)
        addSubview(cellImage)
        addSubview(cellTitle)
        addSubview(cellPrice)
        addSubview(cellPrevPrice)
        addSubview(cellRate)
        addSubview(cellTag)
        
        let constraints = [
            bgView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            cellImage.topAnchor.constraint(equalTo: bgView.topAnchor),
            cellImage.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: bgView.trailingAnchor),
            cellImage.heightAnchor.constraint(equalTo: bgView.heightAnchor, multiplier: 0.70),
            
            cellTitle.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 5),
            cellTitle.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 5),
            cellTitle.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -5),
            
            cellPrice.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -5),
            cellPrice.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 5),
            
            cellPrevPrice.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -5),
            cellPrevPrice.leadingAnchor.constraint(equalTo: cellPrice.trailingAnchor, constant: 5),
            
            cellRate.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -5),
            cellRate.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -5),
            
            cellTag.heightAnchor.constraint(equalToConstant: 25),
            cellTag.widthAnchor.constraint(equalToConstant: 25),
            cellTag.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10),
            cellTag.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
