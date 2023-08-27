//
//  ConnectWebpage.swift
//  iOS_Exercise
//
//  Created by YOUJIM on 2023/07/30.
//

import SafariServices
import UIKit
import SwiftUI

import Then
import SnapKit

class ConnectWebpage: UIViewController {
    
    var URLButton: UIButton = UIButton().then {
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("웹페이지 연결하기", for: .normal)
        $0.addTarget(self, action: #selector(didButtonClicked), for: .touchUpInside)
        $0.sizeToFit()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(URLButton)
        URLButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    @objc func didButtonClicked() {
        let url = NSURL(string: "https://youz2me.notion.site/UIButton-ffc98dbfc08740ea9f16bec8e00d204f?pvs=4")
        let notionView: SFSafariViewController = SFSafariViewController(url: url! as URL)
        
        self.present(notionView, animated: true, completion: nil)
    }
}

struct ConnectWebpage_Preview: PreviewProvider {
    static var previews: some View {
        ConnectWebpage().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
