//
//  GridCollectionVFL.swift
//  damoim
//
//  Created by 원동진 on 2023/02/21.
//

import UIKit

class GridCollectionVFL: UICollectionViewFlowLayout {
    var numberOfColumns = 1
    var ratioHeightToWidth = 0.77
    var cellSpacing = 0.0 {
        didSet{
            self.minimumLineSpacing = self.cellSpacing
            self.minimumInteritemSpacing = self.cellSpacing
        }
    }
    override init() {
        super.init()
        self.scrollDirection = .vertical
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
