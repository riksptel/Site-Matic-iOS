//
//  VehicleAlertsController.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 12/02/23.
//

import UIKit

class VehicleAlertsController: UIViewController, UISearchBarDelegate {
    
    private lazy var searchVehiclesBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.searchBarStyle = .default
        searchbar.sizeToFit()
        searchbar.placeholder = "Search vehicle"
        searchbar.backgroundImage = UIImage()
        searchbar.delegate = self
        return searchbar
    }()
    
    private lazy var vehicleTableView : UITableView = {
        let tv = UITableView()
        tv.register(VehicleDetailsCell.self, forCellReuseIdentifier: VehicleDetailsCell.identifier)
        tv.backgroundColor = .black
        tv.dataSource = self
        tv.rowHeight = 200
        return tv
    }()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupNavigationBar()
        view.addSubview(searchVehiclesBar)
        searchVehiclesBar.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, height: 40)
        view.addSubview(vehicleTableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        vehicleTableView.anchor(top: searchVehiclesBar.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 8)
        
    }
    
    @objc func menuPressed() {
    
    }
    
    @objc func searchPressed() {
        
    }
    
    @objc func notificationPressed() {
        
    }
    
    @objc func userPressed() {
        
    }
    
    func setupNavigationBar() {
        title = "Vehicle Alerts"
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .mobaGray
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.compactAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationBar.isTranslucent = false
        
        //left icons
        let menuButton = UIButton(type: .system)
        menuButton.setImage(UIImage(named: "menu"), for: .normal)
        menuButton.setDimensions(width: 18, height: 18)
        menuButton.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
        
        //right icons
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(named: "search"), for: .normal)
        searchButton.setDimensions(width: 16, height: 16)
        searchButton.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        
        let notificationButton = UIButton(type: .system)
        notificationButton.setImage(UIImage(named: "notification"), for: .normal)
        notificationButton.setDimensions(width: 18 , height: 18)
        notificationButton.addTarget(self, action: #selector(notificationPressed), for: .touchUpInside)
        
        let userButton = UIButton(type: .system)
        userButton.setImage(UIImage(named: "user"), for: .normal)
        userButton.setDimensions(width: 20 , height: 20)
        userButton.addTarget(self, action: #selector(userPressed), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: userButton), UIBarButtonItem(customView: notificationButton), UIBarButtonItem(customView: searchButton) ]
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //perform search
    }
}

extension VehicleAlertsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VehicleDetailsCell.identifier, for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
 
    
    
    
}
