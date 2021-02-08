//
//  AddArtCardCollectionViewCell.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import UIKit

class AddArtCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AddArtCardCollectionViewCell"
    
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
       }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Misturando\ntudo isso o que\nvocê conseguiu fazer?"
        label.font = UIFontMetrics.default.scaledFont(for: CustomFonts(name: "Poppins-Medium", size: 22))
        label.textColor = .grayTitle
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addArtButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Adicionar Arte", for: .normal)
        button.titleLabel?.font = UIFontMetrics.default.scaledFont(for: CustomFonts(name: "Poppins-Medium", size: 17))
        button.setTitleColor(.grayTitle, for: .normal)
        button.tintColor = .grayTitle
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "arrow.up"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
     override init(frame: CGRect) {
         super.init(frame: frame)
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     override func layoutSubviews() {
         setUp()
     }
}

extension AddArtCardCollectionViewCell: ViewCode {
    func buildHierarchy() {
        addSubview(roundedBackgroundView)
        addSubview(titleLabel)
        addSubview(addArtButton)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            roundedBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            roundedBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundedBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor, constant: -16),
            titleLabel.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            addArtButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 27),
            addArtButton.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
            addArtButton.widthAnchor.constraint(equalTo: roundedBackgroundView.widthAnchor, constant: -160),
            addArtButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = .clear
    }
}
