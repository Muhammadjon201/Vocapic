//
//  DictionaryViewController.swift
//  Vocapic
//
//  Created by ericzero on 8/13/23.
//

import UIKit
import AVFoundation

class DictionaryViewController: UIViewController {
        
    @IBOutlet var topView: UIView! {
        didSet {
            topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        }
    }
    
    @IBOutlet var topImageView: UIImageView!{
        didSet{
            topImageView.image = UIImage(named: "sports")
            topImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        }
    }
    
    var speechSynthesizer: AVSpeechSynthesizer!

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var vocabularyTitle: UILabel!
    
    @IBOutlet var dictionaryTable: UITableView!
    let photoViewModel = PhotoViewModel()
    let unsplashModel: [UnsplashPhoto] = []
    
    var selectedVocabulary: SubcategoryDetail?
    var vocabularies: [Vocabulary] = []
    
    private let unsplashAccessKey = "lTUsZhE6strM1zJzxgw-gjPqjSwsDSP5_lcj5QtQOws"
    
    var selectedMicIndex: Int?
    var selectedCellIndex: Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        vocabularyTitle.text = selectedVocabulary?.subcategory
        
        dictionaryTable.delegate = self
        dictionaryTable.dataSource = self
        dictionaryTable.register(UINib(nibName: "DictionaryCell", bundle: nil), forCellReuseIdentifier: "DictionaryCell")
        
        populateSubcategories()
        
        speechSynthesizer = AVSpeechSynthesizer() //3
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        //tutorialPage()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func populateSubcategories() {
        if let selectedCategory = selectedVocabulary {
           vocabularies = selectedCategory.vocabulary
        }
    }

    private func tutorialPage() {
        let popupController = TutorialViewController()
        popupController.modalPresentationStyle = .overFullScreen
        present(popupController, animated: false, completion: nil)
    }
    
    @objc private func labelTapped(withText text: String) {
        fetchRandomPhoto(searchQuery: text) { [weak self] result in
            switch result {
            case .success(let imageData):
                DispatchQueue.main.async {
                    self?.topImageView.image = UIImage(data: imageData)
                }
            case .failure(let error):
                print("Error fetching photo: \(error)")
            }
        }
    }

    // MARK: Photo Fetch Function..
    
    func fetchRandomPhoto(searchQuery: String, completion: @escaping (Result<Data, Error>) -> Void) {
        // Construct the URL with the searchQuery parameter
        guard let encodedQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        guard let url = URL(string: "https://api.unsplash.com/photos/random?client_id=\(unsplashAccessKey)&query=\(encodedQuery)") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            // Check if the data can be parsed as a JSON object
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                completion(.failure(NetworkError.invalidURL))
                return
            }

            // Check if the JSON object contains the expected keys
            if json.keys.contains("urls"), let imageData = json["urls"] as? [String: Any], let regularURLString = imageData["regular"] as? String, let regularURL = URL(string: regularURLString) {
                // Download the image data from the regular URL
                let imageTask = URLSession.shared.dataTask(with: regularURL) { imageData, _, _ in
                    if let imageData = imageData {
                        completion(.success(imageData))
                    } else {
                        completion(.failure(NetworkError.noData))
                    }
                }
                imageTask.resume()
            } else {
                completion(.failure(NetworkError.invalidURL))
            }
        }
        task.resume()
    }
  
    // MARK: Action Buttons..
    
    @IBAction func buttonWorked(_ sender: Any) {
        
      print("worked")
        
        let customAlertView = CustomAlert(frame: CGRect(x: 0, y: 0, width: 300, height: 400))
        customAlertView.center = view.center
        view.addSubview(customAlertView)
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func handleMicButtonTap(at index: Int) {
        selectedMicIndex = index
        dictionaryTable.reloadData()
    }

}

    // MARK: Extension Controller..

extension DictionaryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabularies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DictionaryCell", for: indexPath) as! DictionaryCell
        
        cell.update(data: vocabularies[indexPath.row])
        
        cell.labelTapAction = { [weak self] in
            if let vocabularies = self?.vocabularies {
                self?.labelTapped(withText: vocabularies[indexPath.row].part)
            }
        }
        
        cell.micButtonTapAction = { [weak self] in
            self?.handleMicButtonTap(at: indexPath.row)
        }
            
//        cell.micChange.setImage(selectedMicIndex == indexPath.row ? UIImage(systemName: "waveform.and.mic") : UIImage(systemName: "mic"), for: .normal)
//        
        cell.micChange.tintColor = (selectedCellIndex == indexPath.row) ? UIColor.white : UIColor.black
        
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
        
          tableView.deselectRow(at: indexPath, animated: true) // 4
                
          let selectedVocabulary = vocabularies[indexPath.row]
            
          let englishWord = selectedVocabulary.part // English word

          fetchRandomPhoto(searchQuery: englishWord) { [weak self] result in
                switch result {
                case .success(let imageData):
                    DispatchQueue.main.async {
                        self?.topImageView.image = UIImage(data: imageData)
                    }
                case .failure(let error):
                    //self?.topImageView.image = UIImage(named: "placeholder")
                    print("Error fetching photo: \(error)")
                }
           }
          
           let englishUtterance = AVSpeechUtterance(string: selectedVocabulary.part) //6
           englishUtterance.voice = AVSpeechSynthesisVoice(language: "en-US") //7
           englishUtterance.rate = 0.5 //8

           // Create a speech utterance for the second language (Russian)
           let russianUtterance = AVSpeechUtterance(string: selectedVocabulary.translation) //9
           russianUtterance.voice = AVSpeechSynthesisVoice(language: "ru-RU") // Russian voice //10
           russianUtterance.rate = 0.5 // adjust //12

           // Speak the utterances
           speechSynthesizer.speak(englishUtterance)
           speechSynthesizer.speak(russianUtterance)
            
           selectedMicIndex = indexPath.row
            
           selectedCellIndex = indexPath.row

                   
           tableView.reloadData()
            
    }
}




