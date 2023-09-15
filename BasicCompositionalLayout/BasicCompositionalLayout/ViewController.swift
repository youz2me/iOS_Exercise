//
//  ViewController.swift
//  BasicCompositionalLayout
//
//  Created by YOUJIM on 2023/09/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        
        setDataSource()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        // sectionIndex에 따라 정해진 레이아웃을 리턴
        return UICollectionViewCompositionalLayout(sectionProvider: {[weak self] sectionIndex, _ in
            
            return self?.createBannerSection()
        })
    }
    
    private func createBannerSection() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
}



// 컬렉션뷰 cell UI - 등록
// 레이아웃 구현 - 3가지
// datasource -> cellProvider
// snapshot -> datasource.apply(snapshot)
