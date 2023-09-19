//
//  BannerCollectionViewCell.swift
//  BasicCompositionalLayout
//
//  Created by YOUJIM on 2023/09/15.
//

import UIKit
import SnapKit
import Kingfisher

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let id = "BannerCell"
    let titleLabel = UILabel()
    let backgroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    public func config(title: String, imageUrl: String) {
        // title, image set
        titleLabel.text = title
        
        // imageUrl
        let url = URL(string: imageUrl)
        backgroundImage.kf.setImage(with: url)
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
    }
    
    // 필수적으로 넣어야 하지만 쓰이지는 않음
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


