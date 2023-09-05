//
//  DetailViewController.swift
//  Vocapic
//
//  Created by ericzero on 8/9/23.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedCategory: CategoryDetail?
    
    @IBOutlet var detailTop: UIView! {
        didSet {
            detailTop.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }
    
    var subCategories: [SubcategoryDetail] = []
    
    @IBOutlet var detailCollection: UICollectionView!
    
    
    @IBOutlet var categoryTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        populateSubcategories()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func populateSubcategories() {
           if let selectedCategory = selectedCategory {
               subCategories = selectedCategory.subcategoryDetails
           }
       }
    
    func setUI(){
        categoryTitle.text = selectedCategory?.category
        //self.navigationItem.setHidesBackButton(true, animated: true)

        let navigationBar = navigationController?.navigationBar
        navigationBar?.tintColor = .white

        let backButton = navigationItem.leftBarButtonItem
        backButton?.tintColor = .white
        
        // collection
        
        detailCollection.delegate = self
        detailCollection.dataSource = self
        detailCollection.register(UINib(nibName: "DetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailCollectionViewCell")
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        print("backkk")
    }

}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
        
        let detail = subCategories[indexPath.row]
        cell.updateDetailPage(data: detail)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCategory = subCategories[indexPath.row]
               
        let dictionaryVC = DictionaryViewController(nibName: "DictionaryViewController", bundle: nil)
        dictionaryVC.selectedVocabulary = selectedCategory
        
        dictionaryVC.vocabularyTitle = UILabel()
               
        navigationController?.pushViewController(dictionaryVC, animated: true)
        
    }
    
}
