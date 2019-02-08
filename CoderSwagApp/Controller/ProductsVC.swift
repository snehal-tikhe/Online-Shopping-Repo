//
//  ProductsVC.swift
//  CoderSwagApp
//
//  Created by Snehal Tikhe on 2/5/19.
//  Copyright © 2019 Snehal Tikhe. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var productsColloctionView: UICollectionView!
    @IBOutlet weak var productTypeLbl: UILabel!
    public var products = [Product]()

    var Title = " "
    
     var hats = [
        Product(title: "Devslopes Logo Graphic Beanie", price: "$18", imageName: "hat01.png"),
        Product(title: "Devslopes Logo Hat Black", price: "$22", imageName: "hat02.png"),
        Product(title: "Devslopes Logo Hat White", price: "$22", imageName: "hat03.png"),
        Product(title: "Devslopes Logo Snapback", price: "$20", imageName: "hat04.png")
    ]
    
    var hoodies = [
        Product(title: "Devslopes Logo Hoodie Grey", price: "$32", imageName: "hoodie01.png"),
        Product(title: "Devslopes Logo Hoodie Red", price: "$32", imageName: "hoodie02.png"),
        Product(title: "Devslopes Hoodie Grey", price: "$32", imageName: "hoodie03.png"),
        Product(title: "Devslopes Hoodie Black", price: "$32", imageName: "hoodie04.png"),
        
        ]
    
    var shirts = [
        Product(title: "Devslopes Logo Shirt Black", price: "$18", imageName: "shirt01.png"),
        Product(title: "Devslopes Badge Shirt Light Grey", price: "$19", imageName: "shirt02.png"),
        Product(title: "Devslopes Logo Shirt Red", price: "$18", imageName: "shirt03.png"),
        Product(title: "Hustle Delegate Grey", price: "$18", imageName: "shirt04.png"),
        Product(title: "Kickflip Studios Black", price: "$18", imageName: "shirt05.png")
    ]
    
    var digitalGoods = [Product]()
    
    func initProduct(category:Category)
    {

        Title = category.title
        print(category.title)
        if category.title == "SHIRTS"
        {
            products = shirts
            print(products)
        }
        else if category.title == "HATS"
        {
            products = hats
        }
        else if category.title == "HOODIES"
        {
            products = hoodies
        }
        else
        {
            products = digitalGoods
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productsColloctionView.delegate = self
        productsColloctionView.dataSource = self
        
        productTypeLbl.text = Title
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(products.count)
        return products.count;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        print("IN did select collection.....")
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
        
            let product1 = products[indexPath.row]
            
            print(product1)
            
            cell.productName.text = product1.title
            cell.productPrice.text = product1.price
            cell.productImage.image = UIImage(named: product1.imageName)
            return cell
        }
        return ProductCell()
    }

}
