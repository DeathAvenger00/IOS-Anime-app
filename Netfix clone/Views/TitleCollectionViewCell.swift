//
//  TitleCollectionViewCell.swift
//  Netfix clone
//
//  Created by Soham.C.Athawale on 04/10/22.
//

import UIKit
import SDWebImage
class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionView"
    private let posterimageview: UIImageView = {
        let imageview  = UIImageView()
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterimageview)
    }
    required init?(coder:NSCoder){
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterimageview.frame = contentView.bounds
    }
    public func configure(with model: String){
        guard let url = URL(string:"https://image.tmdb.org/t/p/w500/\(model)")else{
            return
        }
        posterimageview.sd_setImage(with: url,completed: nil)
    }
}
