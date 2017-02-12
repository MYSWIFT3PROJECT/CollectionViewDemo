//
//  CollectionViewCell.swift
//  CollectViewDemo
//
//  Created by ios Developer on 2/6/17.
//  Copyright © 2017 ios Developer. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView:UIImageView!
    var imageName:String!{
        didSet{
            photoImageView.image = UIImage(named: imageName)
        }
    }
}
