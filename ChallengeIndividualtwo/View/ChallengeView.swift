//
//  ChallengeView.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import UIKit

class ChallengeView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        guard let customFont = UIFont(name: "Poppins-Bold", size: 22) else {
            fatalError("""
                Failed to load the "Poppins-Bold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.numberOfLines = 0
        label.text = "Desenhe, ilustre, pinte, \nrabisque ou faça arte usando…"
        label.textColor = .grayTitle
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cellWidthHeightConstant: CGFloat = UIScreen.main.bounds.width * 0.2
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 10,
                                           bottom: 0,
                                           right: 10)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: cellWidthHeightConstant, height: cellWidthHeightConstant)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .orange
        collection.translatesAutoresizingMaskIntoConstraints = false
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

extension ChallengeView: ViewCode {
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(collectionView)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 49),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = .gray
    }
    
    
}
