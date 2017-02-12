//
//  PhotosCollectionViewController.swift
//  CollectViewDemo
//
//  Created by macOSX on 2/12/17.
//  Copyright © 2017 ios Developer. All rights reserved.
//

import UIKit



class PhotosCollectionViewController: UICollectionViewController {
    var photoCategories = PhotoCategory.fectchPhotos()
    struct Storyboard {
        static let photoCell = "PhotoCell"
        static let headerView = "HeaderView"
        static let showDetailSegue = "ShowDetail"
        static let leftAndRightPaddings:CGFloat = 2.0
        static let numberOfItemsPerRow:CGFloat = 3.0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let collectionViewWidth = collectionView?.frame.width
        let itemWith = (collectionViewWidth! - Storyboard.leftAndRightPaddings) / Storyboard.numberOfItemsPerRow
       let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWith, height: itemWith)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return photoCategories.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return photoCategories[section].imageNames.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.photoCell, for: indexPath) as! PhotoCell
        let photoCategory = photoCategories[indexPath.section]
        let imageNames = photoCategory.imageNames
        let imageName = imageNames[indexPath.item]
        cell.imageName = imageName
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.headerView, for: indexPath) as! HeaderView
        let category = photoCategories[indexPath.section]
        headerView.category = category
        return headerView
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = self.photoCategories[indexPath.section]
        let image = UIImage(named: category.imageNames[indexPath.item])
        self.performSegue(withIdentifier: Storyboard.showDetailSegue, sender: image)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showDetailSegue{
            let detailVC = segue.destination as! DetailViewController
            detailVC.image = sender as! UIImage
        }
    }
}
