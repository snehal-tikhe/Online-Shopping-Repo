//
//  ViewController.swift
//  CoderSwagApp
//
//  Created by Snehal Tikhe on 2/3/19.
//  Copyright © 2019 Snehal Tikhe. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var categoryTable: UITableView!
    
        var categories = [
        Category(title: "SHIRTS", imageName: "shirts.png"),
        Category(title: "HOODIES", imageName: "hoodies.png"),
        Category(title: "HATS", imageName: "hats.png"),
        Category(title: "DIGITAL", imageName: "digital.png")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        categoryTable.dataSource = self
        categoryTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
//            let category = DataService.instance.getCategories()[indexPath.row]
//            cell.updateViews(category: category)
        
            let category = categories[indexPath.row]
            
            cell.categoryImage.image = UIImage(named: category.imageName)
            cell.categoryName.text = category.title
            
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]

        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productVC = segue.destination as? ProductsVC
        {
            let barButton = UIBarButtonItem()
            barButton.title = " "
            barButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            navigationItem.backBarButtonItem = barButton
            assert(sender as? Category != nil)
            productVC.initProduct(category: sender as! Category)

        }
    }

}

//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if let productsVC = segue.destination as? ProductsVC {
//        let barBtn = UIBarButtonItem()
//        barBtn.title = ""
//        navigationItem.backBarButtonItem = barBtn
//        assert(sender as? Category != nil)
//        productsVC.initProducts(category: sender as! Category)
//    }
//}
