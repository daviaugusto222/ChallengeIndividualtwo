//
//  ChallengeViewController.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import UIKit

class ChallengeViewController: UIViewController {

    lazy var challengeView: ChallengeView = {
        let view = ChallengeView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myView = challengeView
        myView.collectionView.delegate = self
        myView.collectionView.dataSource = self
        view = myView
    }
    
}

extension ChallengeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
