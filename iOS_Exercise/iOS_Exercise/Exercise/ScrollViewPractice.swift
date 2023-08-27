//
//  ScrollViewPractice.swift
//  iOS_Exercise
//
//  Created by YOUJIM on 2023/08/01.
//

import UIKit
import SwiftUI

import Then
import SnapKit


class ScrollViewPractice: UIViewController {
    
    var scrollView: UIScrollView = UIScrollView().then {
        $0.backgroundColor = .lightGray
    }
    
    var contentView: UIView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    var firstSampleView: UIView = UIView().then {
        $0.backgroundColor = .cyan
    }
    
    var secondSampleView: UIView = UIView().then {
        $0.backgroundColor = .darkGray
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(firstSampleView)
        contentView.addSubview(secondSampleView)
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
        }
        
        firstSampleView.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        secondSampleView.snp.makeConstraints {
            $0.top.equalTo(firstSampleView.snp.bottom)
            $0.height.equalTo(1000)
            $0.bottom.equalToSuperview()
        }
    }
}

struct ScrollViewPractice_Preview: PreviewProvider {
    static var previews: some View {
        ScrollViewPractice().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
