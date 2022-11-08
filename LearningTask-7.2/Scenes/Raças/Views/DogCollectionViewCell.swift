//
//  DogCollectionViewCell.swift
//  LearningTask-7.2
//
//  Created by Laura Pinheiro Marson on 07/11/22.
//

import UIKit

class DogCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var raça: Raça? {
        didSet {
            guard let raça = raça else { return }
            dogImageView.image = UIImage(named: raça.nome)
            nameLabel.text = raça.nome
        }
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let newSize = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        layoutAttributes.size.height = newSize.height
        
        setNeedsLayout()
        return layoutAttributes
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dogImageView.layer.masksToBounds = true
        dogImageView.layer.cornerRadius = contentView.bounds.width / 2
    }
    
}
