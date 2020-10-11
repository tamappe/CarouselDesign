//
//  ViewController.swift
//  CarouselDesign
//
//  Created by 玉置 on 2020/10/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            let nibFiles = [
                FirstCollectionViewCell.identifier
            ]
            nibFiles.forEach { nibFile in
                collectionView.register(UINib(nibName: nibFile, bundle: nil), forCellWithReuseIdentifier: nibFile)
            }
        }
    }
    
    var array: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.array = ["a", "b", "c", "d"]
            self.collectionView.reloadData()
            self.updateLayout()
        }
    }
    
    private func updateLayout() {
        let layout = CarouselCollectionViewFlowLayout()
        let collectionViewSize = collectionView.frame.size
        let cellInsets = UIEdgeInsets(top: 0.0, left: FirstCollectionViewCell.widthInset, bottom: 0.0, right: FirstCollectionViewCell.widthInset)
        
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = cellInsets
        let layoutWidth = collectionViewSize.width - FirstCollectionViewCell.widthInset * 2
        let layoutHeight = layoutWidth * FirstCollectionViewCell.cellHeight / FirstCollectionViewCell.cellWidth
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        collectionView.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.identifier, for: indexPath)

        return cell
    }
}
