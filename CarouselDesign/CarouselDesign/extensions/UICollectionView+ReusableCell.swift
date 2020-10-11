//
//  UICollectionView+ReusableCell.swift
//  CarouselDesign
//
//  Created by 玉置 on 2020/10/11.
//

import Foundation
import UIKit

extension UICollectionView {
    func genericDequeueReusableCell<T>(withIdentifier identifier: String, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }

    func genericDequeueReusableCell<T>(for indexPath: IndexPath) -> T {
        return genericDequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath)
    }
}
