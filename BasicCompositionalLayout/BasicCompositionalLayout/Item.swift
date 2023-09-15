//
//  Item.swift
//  BasicCompositionalLayout
//
//  Created by YOUJIM on 2023/09/15.
//

// MARK: 섹션과 아이템 정의

import Foundation


struct Section: Hashable {
    let id: String
}

// 세가지 타입이 있고 들어가는 타입은 HomeItem으로 정의
enum Item: Hashable {
    case banner(HomeItem)
    case normalCarousel(HomeItem)
    case listCarousel(HomeItem)
}

struct HomeItem: Hashable {
    let title: String
    let subTitle: String? // 옵셔널하게 들어감
    let imageUrl: String
}
