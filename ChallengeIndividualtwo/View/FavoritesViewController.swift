//
//  FavoritesViewController.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 10/02/21.
//

import UIKit

class FavoritesViewController: UIViewController {

    private var favoriteViewModel: FavoritesViewModel!
    
    lazy var favoriteView: FavoritesView = {
        let view = FavoritesView()
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .white
        title = "Favoritos"
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myView = favoriteView
        myView.collectionView.delegate = self
        myView.collectionView.dataSource = self
        view = myView
        callToViewModelForUIUpdate()
    }
    
    
    func callToViewModelForUIUpdate() {
        self.favoriteViewModel = FavoritesViewModel()
        self.favoriteViewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        DispatchQueue.main.async {
            self.favoriteView.collectionView.reloadData()
        }
    }

}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favoriteViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCardCollectionViewCell.identifier, for: indexPath) as! FavoriteCardCollectionViewCell
        cell.config(viewModel: favoriteViewModel.CardCellVM(forIndex: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
//        let selectedFavorite = DetailsViewController()
//        selectedFavorite.selectedFavorite = favoriteViewModel.CardCellVM(forIndex: indexPath.row)
//        
//        selectedVaccine.cardViewController = self
//        navigationController?.pushViewController(selectedVaccine, animated: true)
        
    }
    
    
}
