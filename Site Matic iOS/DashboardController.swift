//
//  DashboardController.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 21/02/23.
//

import UIKit

class DashboardController: UIViewController {
    
    private let showAllSitesView: UIView = {
        let view = UIView()
        
        let label = UILabel()
        label.text = "Show all sites"
        label.textColor = .white
        
        view.addSubview(label)
        label.centerY(inView: view)
        label.anchor(left: view.leftAnchor, paddingLeft: 10)
        
        let selectionButton = UIButton(type: .system)
        selectionButton.setImage(UIImage(named: "arrow_down"), for: .normal)
        selectionButton.setDimensions(width: 20, height: 20)
        
        view.addSubview(selectionButton)
        selectionButton.centerY(inView: view)
        selectionButton.anchor(right: view.rightAnchor, paddingRight: 8)
        
        view.backgroundColor = UIColor.rgb(red: 39, green: 39, blue: 39)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let goButton: UIButton = {
        let goButton = UIButton(type: .system)
        goButton.backgroundColor = UIColor.rgb(red: 255, green: 204, blue: 0)
        goButton.setDimensions(width: 50, height: 50)
        goButton.layer.cornerRadius = 5
        goButton.setImage(UIImage(named: "DashboardController_arrow_right"), for: .normal)
        return goButton
    }() 
    
    private lazy var chartsTableView : UITableView = {
        let tv = UITableView()
        tv.register(ChartsViewCell.self, forCellReuseIdentifier: ChartsViewCell.identifier)
        tv.backgroundColor = .black
        tv.dataSource = self
        tv.rowHeight = 400
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupNavigationBar()
        view.addSubview(chartsTableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(goButton)
        goButton.anchor(top: view.topAnchor, right: view.rightAnchor, paddingTop: 10, paddingRight: 4)
        
        view.addSubview(showAllSitesView)
        showAllSitesView.anchor(top: view.topAnchor, left: view.leftAnchor, right: goButton.leftAnchor, paddingTop: 10, paddingLeft: 4, paddingRight: 4, height: 50)
        
        chartsTableView.anchor(top: showAllSitesView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 16)
        
        
        
    }
    
    @objc func menuPressed() {
        
    }
    
    @objc func userPressed() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
        
        
        
    
    }
    
    func setupNavigationBar() {
        title = "Dashboard"
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .mobaGray
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.compactAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationBar.isTranslucent = false
    
        let menuButton = UIButton(type: .system)
        menuButton.setImage(UIImage(named: "menu"), for: .normal)
        menuButton.setDimensions(width: 18, height: 18)
        menuButton.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
   
        
        let userButton = UIButton(type: .system)
        userButton.setImage(UIImage(named: "user"), for: .normal)
        userButton.setDimensions(width: 20 , height: 20)
        userButton.addTarget(self, action: #selector(userPressed), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: userButton)
    }
}


extension DashboardController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChartsViewCell.identifier, for: indexPath) as! ChartsViewCell
        
        cell.selectionStyle = .none
        
        if indexPath.row == 2 {
            cell.isPieChartEnabled = false
        }
        return cell
    }
    
    
}
