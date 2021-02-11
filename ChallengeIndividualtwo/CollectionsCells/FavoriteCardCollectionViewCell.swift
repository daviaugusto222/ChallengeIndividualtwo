//
//  FavoriteCardCollectionViewCell.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 10/02/21.
//

import UIKit

class FavoriteCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FavoriteCardCollectionViewCell"
    
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Essa Pose"
        label.font = UIFontMetrics.default.scaledFont(for: CustomFonts(name: "Poppins-Medium", size: 22))
        label.textColor = .grayTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageViewOne: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var imageViewTwo: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var imageViewTree: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var imageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageViewOne,imageViewTwo,imageViewTree])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    func config(viewModel: FavoriteCardCellViewModel) {
        self.titleLabel.text = viewModel.titleLabel()
        if let url = viewModel.photosURL() {
            self.imageViewOne.load(url: url[0])
            self.imageViewTwo.load(url: url[1])
            self.imageViewTree.load(url: url[2])
        }
    }
}

extension FavoriteCardCollectionViewCell: ViewCode {
    func buildHierarchy() {
        addSubview(roundedBackgroundView)
        addSubview(titleLabel)
        addSubview(imageStackView)
 
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            roundedBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            roundedBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundedBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: roundedBackgroundView.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            imageStackView.topAnchor.constraint(equalTo: roundedBackgroundView.topAnchor, constant: 60),
            imageStackView.leadingAnchor.constraint(equalTo: roundedBackgroundView.leadingAnchor, constant: 16),
            imageStackView.trailingAnchor.constraint(equalTo: roundedBackgroundView.trailingAnchor, constant: -16),
            imageStackView.bottomAnchor.constraint(equalTo: roundedBackgroundView.bottomAnchor, constant: -16)
        ])

    }
    
    func aditionalConfigurations() {
        backgroundColor = .clear
    }
    
}
