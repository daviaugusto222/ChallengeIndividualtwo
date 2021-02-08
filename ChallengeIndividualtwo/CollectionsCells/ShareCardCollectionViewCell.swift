//
//  ShareCardCollectionViewCell.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import UIKit

class ShareCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ShareCardCollectionViewCell"
    
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
       }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Woow!\nIsso ficou incrível."
        label.font = UIFontMetrics.default.scaledFont(for: CustomFonts(name: "Poppins-Medium", size: 22))
        label.textColor = .grayTitle
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        image.layer.cornerRadius = 20
        image.backgroundColor = .yellow
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var addArtButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Compartilhar", for: .normal)
        button.titleLabel?.font = UIFontMetrics.default.scaledFont(for: CustomFonts(name: "Poppins-Medium", size: 17))
        button.setTitleColor(.grayTitle, for: .normal)
        button.tintColor = .grayTitle
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
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

extension ShareCardCollectionViewCell: ViewCode {
    func buildHierarchy() {
        addSubview(roundedBackgroundView)
        addSubview(imageView)
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
            imageView.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: roundedBackgroundView.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: roundedBackgroundView.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalTo: roundedBackgroundView.heightAnchor, multiplier: 0.5)
        ])
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            addArtButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 27),
            addArtButton.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
            addArtButton.widthAnchor.constraint(equalTo: roundedBackgroundView.widthAnchor, constant: -160),
            addArtButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = .clear
    }
}

