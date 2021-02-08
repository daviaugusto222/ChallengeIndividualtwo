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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.largeTitleDisplayMode = .never
    }
    
}

extension ChallengeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChallengeCardCollectionViewCell", for: indexPath) as! ChallengeCardCollectionViewCell
                
                return cell
    }
    
    
}
