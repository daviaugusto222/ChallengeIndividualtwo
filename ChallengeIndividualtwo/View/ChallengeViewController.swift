//
//  ChallengeViewController.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import UIKit

class ChallengeViewController: UIViewController {
    
    private var challengeViewModel: ChallengeViewModel!
    
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
        
        switch indexPath.row {
        case 3:
            if challengeViewModel.artAdded() {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddArtCardCollectionViewCell", for: indexPath) as! AddArtCardCollectionViewCell
                cell.delegate = self
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShareCardCollectionViewCell", for: indexPath) as! ShareCardCollectionViewCell
                return cell
            }
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChallengeCardCollectionViewCell", for: indexPath) as! ChallengeCardCollectionViewCell
            
            cell.config(viewModel: challengeViewModel.CardCellVM(forIndex: indexPath.row))
            return cell
        }
    }
}

extension ChallengeViewController: ChallengeDelegate {
    func newCombination() {
        challengeViewModel.searchPhotos()
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
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
