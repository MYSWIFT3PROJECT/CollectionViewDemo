//
//  DetailViewController.swift
//  CollectViewDemo
//
//  Created by macOSX on 2/12/17.
//  Copyright © 2017 ios Developer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageViewDetail:UIImageView!
    var image:UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewDetail.image = image
        navigationItem.title = "Photo"
    }
}
