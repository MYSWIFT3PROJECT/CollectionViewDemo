//
//  HeaderView.swift
//  CollectViewDemo
//
//  Created by ios Developer on 2/6/17.
//  Copyright © 2017 ios Developer. All rights reserved.


import UIKit

class HeaderView: UICollectionReusableView {
    @IBOutlet weak  var categoryImageView:UIImageView!
    @IBOutlet weak var categoryLabel:UILabel!
    var category:PhotoCategory!{
        didSet{
            categoryLabel.text = category.title
            categoryImageView.image = UIImage(named:category.categoryImageName)
        }
    }
}
