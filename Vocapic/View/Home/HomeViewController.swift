//
//  HomeViewController.swift
//  Vocapic
//
//  Created by ericzero on 7/30/23.
//

import UIKit


class HomeViewController: UIViewController {
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var sideMenu: UIButton!
    
    @IBOutlet weak var starButton: UIButton!
    
    @IBOutlet var topView: UIView! {
        didSet {
            topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }
        
    @IBOutlet var homecollectionView: UICollectionView!

    //MARK: ACTION BUTTONS

    @IBAction func starTap(_ sender: Any) {
        print("action")
        
    }
    
    @IBAction func menuBtnTapped(_ sender: Any) {
        
        let vc = ContainerViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - DECLARATION
    
    var categories: [CategoryDetail] = []
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        super.viewDidLoad()
        homecollectionView.delegate = self
        homecollectionView.dataSource = self
        homecollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        parseJson()
        
        self.sideMenu.isHidden = true
        self.starButton.isHidden = true

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
    
    //MARK: - FUNCTIONS
    
    func parseJson() {
        if let fileLocation = Bundle.main.url(forResource: "vocapic", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let decoder = JSONDecoder()
                let receivedData = try decoder.decode(Welcome.self, from: data)
                self.categories = receivedData.categoryDetails
                DispatchQueue.main.async {
                    self.homecollectionView.reloadData()
                }
            } catch {
                print("Error on decoding \(error)")
            }
        }
    }
    
}

//MARK: - EXTENSION

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        let category = categories[indexPath.row]
        cell.updateCell(data: category)
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCategory = categories[indexPath.row]
               
        let detailViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailViewController.selectedCategory = selectedCategory
        
        detailViewController.categoryTitle = UILabel()
               
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}


