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
        
        setUI()
        
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        
        setDataSource()
        
        setSnapshot()
    }
    
    private func setUI() {
        self.view.addSubview(collectionView)
        
        collectionView.backgroundColor = .red
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            switch itemIdentifier {
            case .banner(let item):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
                
                cell.config(title: item.title, imageUrl: item.imageUrl)
                
                return cell
            default:
                return UICollectionViewCell()
            }
        })
    }
    
    private func setSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        snapshot.appendSections([Section(id: "Banner")])
        
        let bannerItems = [
            Item.banner(HomeItem(title: "교촌치킨", imageUrl: "https://fitfoodiefinds.com/wp-content/uploads/2021/05/chicken-marinade-7-1365x2048-1-768x1024.jpg")),
            Item.banner(HomeItem(title: "굽네치킨", imageUrl: "https://fitfoodiefinds.com/wp-content/uploads/2021/05/chicken-marinade-7-1365x2048-1-768x1024.jpg")),
            Item.banner(HomeItem(title: "푸라닭치킨", imageUrl: "https://fitfoodiefinds.com/wp-content/uploads/2021/05/chicken-marinade-7-1365x2048-1-768x1024.jpg"))
        ]
        
        snapshot.appendItems(bannerItems, toSection: Section(id: "Banner"))
        
        dataSource?.apply(snapshot)
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
