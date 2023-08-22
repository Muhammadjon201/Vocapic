//
//  DictionaryViewController.swift
//  Vocapic
//
//  Created by ericzero on 8/13/23.
//

import UIKit

class DictionaryViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var dictionaryTable: UITableView!
    let photoViewModel = PhotoViewModel()
    let unsplashModel: [UnsplashPhoto] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dictionaryTable.delegate = self
        dictionaryTable.dataSource = self
        dictionaryTable.register(UINib(nibName: "DictionaryCell", bundle: nil), forCellReuseIdentifier: "DictionaryCell")
        
        
    }

    @objc func labelTapped() {
        photoViewModel.fetchRandomPhoto { [weak self] result in
            switch result {
            case .success(let imageData):
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: imageData)
                }
            case .failure(let error):
                print("Error fetching photo: \(error)")
            }
        }
    }
}

extension DictionaryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DictionaryCell", for: indexPath) as! DictionaryCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
