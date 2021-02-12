//
//  ChallengeCardCollectionViewCell.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import UIKit

class ChallengeCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChallengeCardCollectionViewCell"
    
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
        label.font = UIFontMetrics.default.scaledFont(for: customFonts(name: "Poppins-Medium", size: 22))
        label.textColor = .grayTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        imageView.image = nil
    }
    
    func config(viewModel: ChallengeCardCellViewModel) {
        self.titleLabel.text = viewModel.titleLabel()
        if let img = viewModel.photoURL() {
            self.imageView.load(url: img)
        }
    }
}
extension ChallengeCardCollectionViewCell: ViewCode {
    func buildHierarchy() {
        addSubview(roundedBackgroundView)
        addSubview(titleLabel)
        addSubview(imageView)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            roundedBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            roundedBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundedBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: roundedBackgroundView.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: roundedBackgroundView.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: roundedBackgroundView.trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: roundedBackgroundView.bottomAnchor, constant: -16)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = .clear
    }
}
