//
//  Photo.swift
//  CollectViewDemo
//
//  Created by ios Developer on 2/6/17.
//  Copyright © 2017 ios Developer. All rights reserved.
//

import Foundation
struct PhotoCategory
{
    var categoryImageName:String
    var title:String
    var imageNames:[String]
    static func fectchPhotos()->[PhotoCategory]{
        var categories = [PhotoCategory]()
        let photosData = PhotoLibrary.downloadPhotosData()
        for(categoryName,dict) in photosData{
            if let dict = dict as? [String:Any]{
                let categoryImageName = dict["categoryImageName"] as! String
                if let imageName = dict["imageNames"] as? [String]{
                    let newCategory = PhotoCategory(categoryImageName: categoryImageName, title: categoryName, imageNames: imageName)
                    categories.append(newCategory)
                }
            }
        }
        return categories
    }
}
class PhotoLibrary{
    class func downloadPhotosData()->[String:Any]{
       return [
        "Family":[
                "categoryImageName":"family",
                "imageNames":PhotoLibrary.generateImage(categoryPrefix: "f", numberOfImage: 9)
        ],
        "Foods":[
            "categoryImageName":"foods",
            "imageName":PhotoLibrary.generateImage(categoryPrefix: "fo", numberOfImage: 8)
        ],
        "Travel":[
            "categoryImageName":"travel",
            "imageNames":PhotoLibrary.generateImage(categoryPrefix: "t", numberOfImage: 9)
        ],
        "Nature":[
            "categoryImageName":"nature",
            "imageNames":PhotoLibrary.generateImage(categoryPrefix: "n", numberOfImage: 9)
            ]
        
        ]
    }
    private class func generateImage(categoryPrefix:String,numberOfImage:Int)->[String]{
        var imageNames = [String]()
        for i in 1...numberOfImage {
            imageNames.append("\(categoryPrefix)\(i)")
        }
        return imageNames
    }
}
