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
    
    var receivedData: Welcome?

    
    
    @IBOutlet var homecollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        homecollectionView.delegate = self
        homecollectionView.dataSource = self
        homecollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        parseJson()
    }
    
    func parseJson() -> Welcome? {
      if let fileLocation = Bundle.main.url(forResource: "vocapic", withExtension: "json") {
        
        do {
          let data = try Data(contentsOf: fileLocation)
          let decoder = JSONDecoder()
          let receivedData = try decoder.decode(Welcome.self, from: data)
          self.receivedData = receivedData
          //print(receivedData)
          DispatchQueue.main.async {
            self.homecollectionView.reloadData()
          }
        }
        catch {
          print("Error on decoding \(error)")
        }
      }
      return nil
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return receivedData?.categoryDetails.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell

        guard let categories = receivedData?.categoryDetails else {
                return cell
            }

            let category = categories[indexPath.row]
            cell.updateCell(data: category.category)

        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}


