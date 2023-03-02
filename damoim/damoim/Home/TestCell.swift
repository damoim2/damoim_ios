//
//  TestCell.swift
//  damoim
//
//  Created by 원동진 on 2023/03/02.
//

import UIKit
import SnapKit
class TestCell: UICollectionViewCell {
    private lazy var testView : UIView = {
        let test = UIView()
        test.backgroundColor = .blue
        return test
    }()
    static let identi = "TestCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCell()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    func setCell(){
        self.contentView.addSubview(testView)
        testView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
