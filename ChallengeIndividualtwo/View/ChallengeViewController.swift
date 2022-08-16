//
//  ChallengeViewController.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import UIKit

class ChallengeViewController: UIViewController {
    
    private var challengeViewModel: ChallengeViewModel!
    var countCalls = 0
    
    lazy var challengeView: ChallengeView = {
        let view = ChallengeView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = challengeView
        myView.collectionView.delegate = self
        myView.collectionView.dataSource = self
        myView.delegate = self
        view = myView
        callToViewModelForUIUpdate()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = .green
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(favoriteTapped))
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Desafios", style: .plain, target: nil, action: nil)
    }
    
    func changeUnfilled() {
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart")
    }
    
    @objc func favoriteTapped() {
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")
        challengeViewModel.favoritedChallenge()
    }
    
    func callToViewModelForUIUpdate() {
        self.challengeViewModel = ChallengeViewModel()
        self.challengeViewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        DispatchQueue.main.async {
            self.challengeView.collectionView.reloadData()
        }
    }
    
}

extension ChallengeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        challengeViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChallengeCardCollectionViewCell", for: indexPath) as! ChallengeCardCollectionViewCell
            
            cell.config(viewModel: challengeViewModel.cardCellVM(forIndex: indexPath.row))
            return cell
        
    }
}

extension ChallengeViewController: ChallengeDelegate {
    func newCombination() {
        
        if countCalls <= 10 {
            challengeViewModel.searchPhotos()
            changeUnfilled()
            countCalls += 1
        } else {
            let alert = UIAlertController(title: "Limite atingido", message: "Para esse teste, existe uma limite máximo de 10 requisições.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: { (alert: UIAlertAction!) -> Void in})
            
            alert.addAction(alertAction)
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    func newFavorite() {
        let destination = FavoritesViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
}

extension ChallengeViewController: AddArtDelegate {
    func addArt() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
}

extension ChallengeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
