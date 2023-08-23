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
    @IBOutlet var vocabularyTitle: UILabel!
    
    @IBOutlet var dictionaryTable: UITableView!
    let photoViewModel = PhotoViewModel()
    let unsplashModel: [UnsplashPhoto] = []
    
    var selectedVocabulary: SubcategoryDetail?
    var vocabularies: [Vocabulary] = []
    
//    var isSelected: Bool = true
//    var selectedRow: Int? = nil
    
    var selectedMicIndex: Int?
    var selectedCellIndex: Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vocabularyTitle.text = selectedVocabulary?.subcategory
        
        dictionaryTable.delegate = self
        dictionaryTable.dataSource = self
        dictionaryTable.register(UINib(nibName: "DictionaryCell", bundle: nil), forCellReuseIdentifier: "DictionaryCell")
        
        populateSubcategories()
    }
    
    func populateSubcategories() {
           if let selectedCategory = selectedVocabulary {
               vocabularies = selectedCategory.vocabulary
           }
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
    
  
    @IBAction func buttonWorked(_ sender: Any) {
        
      print("worked")
        
    }
    
    
    
    func handleMicButtonTap(at index: Int) {
        selectedMicIndex = index
        dictionaryTable.reloadData()
    }

}

extension DictionaryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabularies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DictionaryCell", for: indexPath) as! DictionaryCell
        
        cell.update(data: vocabularies[indexPath.row])
        
        cell.micButtonTapAction = { [weak self] in
            self?.handleMicButtonTap(at: indexPath.row)
        }
            
        cell.micChange.setImage(selectedMicIndex == indexPath.row ? UIImage(systemName: "waveform.and.mic") : UIImage(systemName: "mic"), for: .normal)
        
        // cell background image change
        
        cell.backgroundSplashView.backgroundColor = indexPath.row == selectedCellIndex ? .systemPink : .white
    
        
        cell.firstLanguage.textColor = indexPath.row == selectedCellIndex ? .white : .black
        cell.secondLanguage.textColor = indexPath.row == selectedCellIndex ? .white: .black
        cell.lineLabel.textColor = indexPath.row == selectedCellIndex ? .white: .black
       
        
        cell.micChange.setImage(indexPath.row == selectedMicIndex ? UIImage(systemName: "waveform.and.mic") : UIImage(systemName: "mic"), for: .normal)
           
         
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dictionaryTable.deselectRow(at: indexPath, animated: true)
    
        selectedMicIndex = indexPath.row
        
        selectedCellIndex = indexPath.row

               
        tableView.reloadData()
        
    }
}
