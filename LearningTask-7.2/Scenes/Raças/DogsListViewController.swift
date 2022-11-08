//
//  ViewController.swift
//  LearningTask-7.2
//
//  Created by rafael.rollo on 13/05/2022.
//

import UIKit

class DogsListViewController: UICollectionViewController {
    
    var dogsAPI: DogsAPI?
    
    var dogs: [Raça] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        loadDogs()
    }
    
    private func loadDogs() {
        guard let dogsAPI = dogsAPI else { return }
        dogs = dogsAPI.listaRaças()
    }

}

extension DogsListViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogs.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogViewCell", for: indexPath) as? DogCollectionViewCell else {
            fatalError("Não foi possível carregar célula")
        }
        
        cell.raça = dogs[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath)
            return header
        default:
            fatalError("Tipo de view não suportado: \(kind)")
        }
    }
}

extension DogsListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Não foi possível carregar o layout")
        }
        
        let itemsPerLine: CGFloat = 3
        
        let sectionMargins = flowLayout.sectionInset
        let itemsSpacing = flowLayout.minimumInteritemSpacing
        
        let utilWidth = collectionView.bounds.width - (sectionMargins.left + sectionMargins.right) - itemsSpacing * (itemsPerLine - 1)
        let itemWidth = utilWidth / itemsPerLine
        

        return CGSize(width: itemWidth, height: itemWidth * 1.45)
    }
    
}
