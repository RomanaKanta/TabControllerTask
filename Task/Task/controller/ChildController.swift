//
//  ChildController.swift
//  Task
//
//  Created by Romana on 28/9/22.
//

import UIKit
import AlamofireImage
import Alamofire

class ChildController: BaseController, UICollectionViewDelegate, UICollectionViewDataSource, CustomProtocol {
    func forMakeup(content: [MakeupProduct]) {
        self.makeupData = content
        self.collectionView.reloadData()
    }
    
    func forFood(content: [Categories]) {
        self.foodData = content
        self.collectionView.reloadData()
    }
    
    func forDrinks(content: [Drinks]) {
        self.drinksData = content
        self.collectionView.reloadData()
    }
    
    
    var collectionView: UICollectionView!
    
    fileprivate let cellID = "CollectionViewCell"
    var makeupData = [MakeupProduct]()
    var foodData = [Categories]()
    var drinksData = [Drinks]()
    
    var dataConsumer: DataConsumer!
    var tabTag: String = AppConstant.TAB1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#F7F5FFFF")
        self.dataConsumer = DataConsumer(controller: self,delegate: self)
        
        switch tabTag{
        case AppConstant.TAB1:
            setToolbar(title: "Makeup Products")
            self.dataConsumer.getMakeupData()
            break
            
        case AppConstant.TAB2:
            setToolbar(title: "Food Products")
            self.dataConsumer.getFoodData()
            break
            
        case AppConstant.TAB3:
            setToolbar(title: "Drinks Recipe")
            self.dataConsumer.getDrinksData()
            break
            
        default:
            break
        }
        setView()
        
    }
    
    func setView(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 120, right: 20)
        let wd = (self.view.bounds.width*0.5)-30
        layout.itemSize = CGSize(width:wd, height: wd*1.5)
       
        collectionView = UICollectionView(frame: CGRect(x: 0,y: toolbar.frame.height,width: self.view.frame.width, height: (self.view.frame.height-toolbar.frame.height)), collectionViewLayout: layout)
    
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        self.collectionView.alwaysBounceVertical = true
        
        view.addSubview(collectionView)

        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionViewCell
        
        switch tabTag{
        case AppConstant.TAB1:
            let item = makeupData[indexPath.row]
            cell.cellTitle.text = item.name
            cell.cellPrice.text = "$\(item.price)"
            cell.cellRate.text = " 4.6 "
            cell.cellRate.addTrailing(image: UIImage(named: "star")!)
            dataConsumer.loadImage(url: item.image_link, imageView: cell.cellImage)
            break
            
        case AppConstant.TAB2:
            let item = foodData[indexPath.row]
            cell.cellTitle.text = item.strCategory
            cell.cellPrice.text = "$288"
            cell.cellRate.text = " 4.6 "
            cell.cellRate.addTrailing(image: UIImage(named: "star")!)
            dataConsumer.loadImage(url: item.strCategoryThumb, imageView: cell.cellImage)
            break
            
        case AppConstant.TAB3:
            let item = drinksData[indexPath.row]
            cell.cellTitle.text = item.strDrink
            cell.cellPrice.text = "$288"
            cell.cellRate.text = " 4.6 "
            cell.cellRate.addTrailing(image: UIImage(named: "star")!)
            dataConsumer.loadImage(url: item.strDrinkThumb, imageView: cell.cellImage)
            break
            
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch tabTag{
        case AppConstant.TAB1:
            return self.makeupData.count
            
        case AppConstant.TAB2:
            return self.foodData.count
            
        case AppConstant.TAB3:
            return self.drinksData.count
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (tabTag == AppConstant.TAB3){
            let item: Drinks = drinksData[indexPath.row]
            let viewController = DetailController()
            viewController.item = item
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true, completion: nil)
        }
    }
    
}
