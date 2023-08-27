//
//  ViewController.swift
//  iOS_Exercise
//
//  Created by YOUJIM on 2023/07/28.
//

import SwiftUI
import UIKit

import SnapKit
import Then

class ViewController: UIViewController {

    var tableView: UITableView = UITableView()
    var exerciseList = [
        "버튼 누르면 웹사이트로 연결하기",
        "UIScrollView 코드로 구현하기"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpLayout()
        setUpDelegate()
        setUpConstraint()
    }
    
    // MARK: View
    
    func setUpView() {
        view.backgroundColor = .white
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        view.addSubview(tableView)
    }
    
    
    // MARK: Delegate
    
    func setUpDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        tableView.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(UIScreen.main.bounds.size.height)
        }
    }
    
}

// MARK: Extension

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = exerciseList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            navigationController?.pushViewController(ConnectWebpage(), animated: true)
        }
        else if indexPath.row == 1 {
            navigationController?.pushViewController(ScrollViewPractice(), animated: true)
        }
    }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
