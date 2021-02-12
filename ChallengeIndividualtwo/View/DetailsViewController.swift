//
//  DetailsViewController.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 11/02/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private var detailsViewModel: DetailsViewModel!
    
    var selectedFavorite: FavoriteCardCellViewModel!
    
    lazy var detailsView: DetailsView = {
        let view = DetailsView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = detailsView
        myView.collectionView.delegate = self
        myView.collectionView.dataSource = self
        //myView.delegate = self
        view = myView
        callToViewModelForUIUpdate()
        
        detailsViewModel.getPhotos(challenge: selectedFavorite)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = .green
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(unfavoriteTapped))
    }
    
    func changeUnfilled() {
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart")
    }
    
    @objc func unfavoriteTapped() {
        
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")
        //detailsViewModel.favoritedChallenge()
    }
    
    func callToViewModelForUIUpdate() {
        self.detailsViewModel = DetailsViewModel()
        self.detailsViewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        DispatchQueue.main.async {
            self.detailsView.collectionView.reloadData()
        }
    }
    
}

extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        detailsViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case -1:
            if detailsViewModel.artAdded() {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddArtCardCollectionViewCell", for: indexPath) as! AddArtCardCollectionViewCell
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShareCardCollectionViewCell", for: indexPath) as! ShareCardCollectionViewCell
                return cell
            }
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChallengeCardCollectionViewCell", for: indexPath) as! ChallengeCardCollectionViewCell
            cell.config(viewModel: detailsViewModel.cardCellVM(forIndex: indexPath.row))
            return cell
        }
    }
}
