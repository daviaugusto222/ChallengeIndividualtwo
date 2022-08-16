//
//  DetailsView.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 11/02/21.
//

import UIKit

class DetailsView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cellWidthConstant: CGFloat = UIScreen.main.bounds.width * 0.9
        let cellHeightConstant: CGFloat = UIScreen.main.bounds.height * 0.7
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: cellWidthConstant, height: cellHeightConstant)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        
        collection.register(ChallengeCardCollectionViewCell.self, forCellWithReuseIdentifier: "ChallengeCardCollectionViewCell")
        collection.register(AddArtCardCollectionViewCell.self, forCellWithReuseIdentifier: "AddArtCardCollectionViewCell")
        collection.register(ShareCardCollectionViewCell.self, forCellWithReuseIdentifier: "ShareCardCollectionViewCell")
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailsView: ViewCode {
    func buildHierarchy() {
        addSubview(collectionView)
    }
    
    func setUpLayoutConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -20)
        ])
        
    }
    
    func aditionalConfigurations() {
        backgroundColor = .green
    }
}
