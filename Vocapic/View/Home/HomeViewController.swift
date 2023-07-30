//
//  HomeViewController.swift
//  Vocapic
//
//  Created by ericzero on 7/30/23.
//

import UIKit


class HomeViewController: UIViewController {
    @IBOutlet var topView: UIView! {
        didSet{
            topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }
    
    var items: [CategoryDetail] = []
    
    @IBOutlet var homecollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        homecollectionView.delegate = self
        homecollectionView.dataSource = self
        homecollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        if let parsedItems = parseJSONFromFile() {
                    items = parsedItems
            homecollectionView.reloadData()
        }
        
        parseJSONFromFile()
                
    }
    
    func parseJSONFromFile() -> [CategoryDetail]? {
        if let path = Bundle.main.path(forResource: "vocapic", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            
            let decoder = JSONDecoder()
            
            do {
                let items = try decoder.decode([CategoryDetail].self, from: jsonData)
                return items
            } catch {
                print("Error decoding JSON: \(error)")
                return nil
            }
        }
        return nil
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        //cell.updateCell(data: items[indexPath.row])
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let collectionHeight = collectionView.bounds.height
//        let height = collectionHeight * 0.08
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}


