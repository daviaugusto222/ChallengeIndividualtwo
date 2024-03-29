//
//  ChallengeView.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import UIKit

class ChallengeView: UIView {
    
    weak var delegate: ChallengeDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics.default.scaledFont(for: customFonts(name: "Poppins-Bold", size: 22))
        label.numberOfLines = 0
        label.text = "Desenhe, ilustre, pinte, \nrabisque ou faça arte usando…"
        label.textColor = .grayTitle
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cellWidthConstant: CGFloat = UIScreen.main.bounds.width * 0.9
        let cellHeightConstant: CGFloat = UIScreen.main.bounds.height * 0.59
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
    
    lazy var newCombinationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Nova Combinação", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFontMetrics.default.scaledFont(for: customFonts(name: "Poppins-Medium", size: 14))
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange
        button.imageEdgeInsets.right = 20.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var favoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Favoritos", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFontMetrics.default.scaledFont(for: customFonts(name: "Poppins-Medium", size: 14))
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .green
        button.imageEdgeInsets.right = 17.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        newCombinationButton.addTarget(self, action: #selector(newCombinationAction), for: .touchUpInside)
        favoritesButton.addTarget(self, action: #selector(favoritesButtonAction), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func newCombinationAction() {
        delegate?.newCombination()
    }
    
    @objc func favoritesButtonAction() {
        delegate?.newFavorite()
    }

}

extension ChallengeView: ViewCode {
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(collectionView)
        addSubview(newCombinationButton)
        addSubview(favoritesButton)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
        ])
        
        NSLayoutConstraint.activate([
            newCombinationButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 40),
            newCombinationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            newCombinationButton.trailingAnchor.constraint(equalTo: favoritesButton.leadingAnchor, constant: -16),
            newCombinationButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            newCombinationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            favoritesButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 40),
            favoritesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            favoritesButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = .gray
    }
    
}
