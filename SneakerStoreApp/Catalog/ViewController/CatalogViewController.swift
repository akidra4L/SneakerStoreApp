//
//  CatalogViewController.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 31.05.2023.
//

import UIKit

class CatalogViewController: UIViewController {
    
    var shoes: [Shoes] = [
        Shoes(image: UIImage(named: "1")!),
        Shoes(image: UIImage(named: "2")!),
        Shoes(image: UIImage(named: "3")!),
        Shoes(image: UIImage(named: "4")!),
        Shoes(image: UIImage(named: "5")!),
    ]
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let newCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return newCollectionView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Hello, Sneakerhead!"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ShoesCell.self, forCellWithReuseIdentifier: ShoesCell.cellIdentifier)
        
        setUI()
    }
    
    private func setUI() {
        [collectionView].forEach { self.view.addSubview($0) }
        
        self.view.backgroundColor = Colors.grayMainBackground
        collectionView.backgroundColor = Colors.grayMainBackground

        setConstraints()
    }
    
    private func setConstraints() {
        collectionView.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingTop: 16, paddingRight: 16, paddingBottom: 100, paddingLeft: 16)
    }
}

extension CatalogViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoesCell.cellIdentifier, for: indexPath) as? ShoesCell else {
            return UICollectionViewCell()
        }
        
        cell.shoes = shoes[indexPath.item]
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension CatalogViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("click")
    }
}

extension CatalogViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left + sectionInsets.right + 10.0
        let availableWidth = collectionView.bounds.width - paddingSpace
        let widthPerItem = availableWidth / 2
        let height: CGFloat = 282
        return CGSize(width: widthPerItem, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.top
    }
}
