//
//  HeaderUIView.swift
//  Netfix clone
//
//  Created by Soham.C.Athawale on 02/10/22.
//

import UIKit

class HeaderUIView: UIView {
    private let downloadbutton: UIButton = {
        let button = UIButton()
        button.setTitle("download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    private let playbutton: UIButton = {
        let button = UIButton()
        button.setTitle("play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "DBSSH_poster_with_new_release_date")
        return imageView
    }()
    private func addGradient(){
        let gradientlayer = CAGradientLayer()
        gradientlayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientlayer.frame = bounds
        layer.addSublayer(gradientlayer)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerImageView)
        addGradient()
        addSubview(playbutton)
        addSubview(downloadbutton)
        applyconstraints()
    }
    private func applyconstraints(){
        let playbuttonconstraints = [
            playbutton.leadingAnchor .constraint(equalTo: leadingAnchor,constant:70),
            playbutton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -30),
            playbutton.widthAnchor.constraint(equalToConstant: 100)
    ]
        let downloadbuttonconstraints = [
            downloadbutton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadbutton.bottomAnchor.constraint(equalTo: bottomAnchor, constant:-30),
            downloadbutton.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(downloadbuttonconstraints)
        NSLayoutConstraint.activate(playbuttonconstraints)
    }
    override func layoutSubviews() {
        headerImageView.frame = bounds
    }
    required init(coder:NSCoder) {
        fatalError()
    }
    
}
