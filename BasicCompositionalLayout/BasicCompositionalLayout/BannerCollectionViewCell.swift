//
//  BannerCollectionViewCell.swift
//  BasicCompositionalLayout
//
//  Created by YOUJIM on 2023/09/15.
//

import UIKit
import SnapKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let id = "BannerCell"
    let titleLabel = UILabel()
    let backgroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    private func setUI() {
        /// Snapkit 사용
        self.addSubview(titleLabel)
        self.addSubview(backgroundImage)
        
        /// Constraint 적용
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        public func config(title: String, imageUrl: String) {
            /// title, image set
            titleLabel.text = "Title"
            // imageUrl
        }
    }
}


