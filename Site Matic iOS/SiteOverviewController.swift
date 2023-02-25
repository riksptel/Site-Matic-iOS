//
//  SiteOverviewController.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 11/02/23.
//

import UIKit

class SiteOverviewController: UIViewController {
    
    var backgroundView: UIView!
    
    //TODO:- make a reusable component, selector concern (optional)
    private let sitesView: UIView = {
        let view = UIView()
        
        let label = UILabel()
        label.text = "All Sites"
        label.textColor = .white
        
        view.addSubview(label)
        label.centerY(inView: view)
        label.anchor(left: view.leftAnchor, paddingLeft: 10)
        
        let selectionButton = UIButton(type: .system)
        selectionButton.setImage(UIImage(named: "arrow_down"), for: .normal)
        selectionButton.setDimensions(width: 25, height: 25)
        
        view.addSubview(selectionButton)
        selectionButton.centerY(inView: view)
        selectionButton.anchor(right: view.rightAnchor, paddingRight: 3)
        //        selectionButton.addTarget(SiteOverviewController.self, action: #selector(selectionButtonPressed), for: .touchUpInside)
        view.backgroundColor = UIColor.rgb(red: 39, green: 39, blue: 39)
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        
        return view
    }()
    
    private let selectAllView: UIView = {
        let view = UIView()
        
        let label = UILabel()
        label.text = "Select All"
        label.textColor = .white
        
        view.addSubview(label)
        label.centerY(inView: view)
        label.anchor(left: view.leftAnchor, paddingLeft: 10)
        
        let selectionButton = UIButton(type: .system)
        selectionButton.setImage(UIImage(named: "arrow_down"), for: .normal)
        selectionButton.setDimensions(width: 25, height: 25)
        
        view.addSubview(selectionButton)
        selectionButton.centerY(inView: view)
        selectionButton.anchor(right: view.rightAnchor, paddingRight: 3)
        //        selectionButton.addTarget(SiteOverviewController.self, action: #selector(selectAllButtonPressed), for: .touchUpInside)
        view.backgroundColor = UIColor.rgb(red: 39, green: 39, blue: 39)
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        
        return view
    }()
    
    private let icTotalEquipmentBtn: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "ic_total_equipment"), textColor: .white, iconDimension: 30, text: nil, labelFont: UIFont.boldSystemFont(ofSize: 30))
        return view
    }()
    
    private let icActiveBtn: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "ic_active"), textColor: .green, iconDimension: 30, text: nil, labelFont: UIFont.boldSystemFont(ofSize: 30))
        return view
    }()
    
    private let icInActive: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "ic_inactive"), textColor: .red, iconDimension: 30, text: nil, labelFont: UIFont.boldSystemFont(ofSize: 30))
        return view
    }()
    
    private let icBreakdownBtn: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "ic_breakdown"), textColor: .yellow, iconDimension: 30, text: nil, labelFont: UIFont.boldSystemFont(ofSize: 30))
        return view
    }()
    
    private let icStoppedBtn: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "ic_stopped"), textColor: .systemBlue, iconDimension: 30, text: nil, labelFont: UIFont.boldSystemFont(ofSize: 30))
        return view
    }()
    
    private let icPeopleBtn: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "ic_people"), textColor: .systemGreen, iconDimension: 30, text: nil, labelFont: UIFont.boldSystemFont(ofSize: 30))
        return view
    }()
    
    private let mapView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 26, green: 26, blue: 26)
        return view
    }()
    
    private let icOverspeed: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "ic_overspeed"), textColor: .white, iconDimension: 30, text: nil, labelFont: UIFont.systemFont(ofSize: 20, weight: .light))
        return view
    }()

    private let icFuelTheft: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "ic_fuel_theft"), textColor: .white, iconDimension: 30, text: nil, labelFont:UIFont.systemFont(ofSize: 20, weight: .light))
        return view
    }()

    private let icOverStoppage: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "ic_overstoppage"), textColor: .white, iconDimension: 30, text: nil, labelFont: UIFont.systemFont(ofSize: 20, weight: .light))
        return view
    }()

    private let icPowerDisconnect: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "ic_power_disconnect"), textColor: .white, iconDimension: 30, text: nil, labelFont: UIFont.systemFont(ofSize: 20, weight: .light))
        return view
    }()

    private let icGeoFence: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "ic_geo_fence"), textColor: .white, iconDimension: 30, text: nil, labelFont: UIFont.systemFont(ofSize: 20, weight: .light))
        return view
    }()
//
    private let vehicle: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "vehicle"), textColor: .orange, iconDimension: 25, text: nil, labelFont: UIFont.systemFont(ofSize: 11, weight: .light))
        return view
    }()
    
    private let calendar: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "date_time"), textColor: .systemGreen, iconDimension: 25, text: nil, labelFont: UIFont.systemFont(ofSize: 11, weight: .light))
        return view
    }()
    
    private let companyName: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "company_name"), textColor: .systemBlue, iconDimension: 25, text: nil, labelFont: UIFont.systemFont(ofSize: 11, weight: .light))
        return view
    }()
    
    private let siteIcon: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "site_icon"), textColor: .systemYellow, iconDimension: 25, text: nil, labelFont: UIFont.systemFont(ofSize: 11, weight: .light))
        return view
    }()
    
    private let contact: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "contact"), textColor: .blue, iconDimension: 25, text: nil, labelFont: UIFont.systemFont(ofSize: 11, weight: .light))
        return view
    }()
    
    private let faceRecognize: UIView = {
        let view = UIView().createDashboardButton(image: UIImage(named: "face_recognize"), textColor: .green, iconDimension: 25, text: nil, labelFont: UIFont.systemFont(ofSize: 11, weight: .light))
        return view
    }()
    
    //Helpers
    @objc func selectionButtonPressed() {
        
    }
    
    
    @objc func menuOpenerButtonPressed() {
        
    }
    
    //Left icons
    @objc func menuPressed() {
        
    }
    
    //Right icons
    @objc func searchPressed() {
        
    }
    
    @objc func notificationPressed() {
        
    }
    
    @objc func userPressed() {
        
    }
    
    //View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupNavigationBar()
        setupUI()
        setupDashboard()
    }
    
    func setupDashboard() {
        let stackView1 = UIStackView(arrangedSubviews: [icTotalEquipmentBtn, icActiveBtn, icInActive])
        stackView1.spacing = 5.0
        stackView1.axis = .horizontal
        stackView1.distribution = .fillEqually
        view.addSubview(stackView1)
        stackView1.anchor(top: backgroundView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 5, paddingRight: 8, height: 40)
        
        let stackView2 = UIStackView(arrangedSubviews: [icBreakdownBtn, icStoppedBtn, icPeopleBtn])
        stackView2.spacing = 5.0
        stackView2.axis = .horizontal
        stackView2.distribution = .fillEqually
        view.addSubview(stackView2)
        stackView2.anchor(top: stackView1.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 5, paddingRight: 8, height: 40)
        
        view.addSubview(mapView)
        mapView.anchor(top: stackView2.bottomAnchor, left: view.leftAnchor, paddingTop: 8, paddingLeft: 5, width: view.frame.size.width * 0.64, height: view.frame.size.height * 0.25)
        
        let stackView3 = UIStackView(arrangedSubviews: [icOverspeed, icFuelTheft, icOverStoppage, icPowerDisconnect, icGeoFence])
        stackView3.spacing = 5.0
        stackView3.axis = .vertical
        stackView3.distribution = .fillEqually
        view.addSubview(stackView3)
        stackView3.anchor(top: stackView2.bottomAnchor, left: mapView.rightAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 5, paddingRight: 5, height: view.frame.size.height * 0.25)
        
        //Equipment view
        let equipmentDetailsView = UIView()
        equipmentDetailsView.backgroundColor = UIColor.rgb(red: 25, green: 25, blue: 25)
        //Gray view with image and text
        let equipmentDetailsTextBackgroundView = UIView()
        equipmentDetailsTextBackgroundView.backgroundColor = UIColor.rgb(red: 49, green: 49, blue: 49)
        
        equipmentDetailsView.addSubview(equipmentDetailsTextBackgroundView)
        equipmentDetailsTextBackgroundView.anchor(top: equipmentDetailsView.topAnchor, left: equipmentDetailsView.leftAnchor, right: equipmentDetailsView.rightAnchor, height: 35)
        
        let truckIconImageView = UIImageView()
        truckIconImageView.backgroundColor = .red
        truckIconImageView.setDimensions(width: 25, height: 25)
        truckIconImageView.layer.cornerRadius = 12.5
        
        equipmentDetailsTextBackgroundView.addSubview(truckIconImageView)
        truckIconImageView.centerY(inView: equipmentDetailsTextBackgroundView)
        truckIconImageView.anchor(left: equipmentDetailsTextBackgroundView.leftAnchor, paddingLeft: 5)
        
        let label = UILabel()
        label.text = "Equipment Details"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        
        equipmentDetailsTextBackgroundView.addSubview(label)
        label.centerY(inView: equipmentDetailsTextBackgroundView)
        label.anchor(left: truckIconImageView.rightAnchor, paddingLeft: 8)
        
        view.addSubview(equipmentDetailsView)
        equipmentDetailsView.anchor(top: mapView.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingRight: 8)
        
         //metadata
        let helperStackView = UIStackView(arrangedSubviews: [calendar, companyName])
        helperStackView.axis = .horizontal
        helperStackView.distribution = .fillEqually
        helperStackView.spacing = 5
        
       
        
        let fuelView = UIView().vehicleMetaDetails(imageName: "fuel", mainText: "35.58L", supplementText: "23 Aug 2021, 7:15 am")
        let locationView = UIView().vehicleMetaDetails(imageName: "location", textColor: .yellow, mainText: "12.22 kmpl",  supplementText: "14:00 am")
        let fuelDropView = UIView().vehicleMetaDetails(imageName: "fuel_drop", mainText: "54554")
        
        equipmentDetailsView.addSubview(fuelView)
        fuelView.anchor(top: equipmentDetailsTextBackgroundView.bottomAnchor, left: equipmentDetailsView.leftAnchor, paddingTop: 10, paddingLeft: 10, width: view.frame.size.width * 0.33, height: 50)
        
        equipmentDetailsView.addSubview(locationView)
        locationView.centerX(inView: equipmentDetailsView)
        locationView.anchor(top: equipmentDetailsTextBackgroundView.bottomAnchor, paddingTop: 10, width: view.frame.size.width * 0.33, height: 50)
        
        equipmentDetailsView.addSubview(fuelDropView)
        fuelDropView.anchor(top: equipmentDetailsTextBackgroundView.bottomAnchor, right: equipmentDetailsView.rightAnchor, paddingTop: 10, paddingRight: 10, width: view.frame.size.width * 0.33, height: 45)
        
        let vehicleDetailsStackView = UIStackView(arrangedSubviews: [vehicle, helperStackView, siteIcon, contact, faceRecognize])
        vehicleDetailsStackView.axis = .vertical
        vehicleDetailsStackView.distribution = .fillEqually
        vehicleDetailsStackView.spacing = 2
        vehicleDetailsStackView.layer.borderColor = UIColor.lightGray.cgColor
        vehicleDetailsStackView.layer.borderWidth = 1.0
        
        equipmentDetailsView.addSubview(vehicleDetailsStackView)
        vehicleDetailsStackView.anchor(top: fuelView.bottomAnchor, left: equipmentDetailsView.leftAnchor, bottom: equipmentDetailsView.bottomAnchor, right: equipmentDetailsView.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 12, paddingRight: 10)
    

    }
    
    func setupUI() {
        backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.rgb(red: 45, green: 45, blue: 45)
        
        view.addSubview(backgroundView)
        backgroundView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, height: 50)
        
        let goButton = UIButton(type: .system)
        goButton.backgroundColor = UIColor.rgb(red: 255, green: 204, blue: 0)
        goButton.setDimensions(width: 30, height: 30)
        goButton.layer.cornerRadius = 4
        goButton.setImage(UIImage(named: "arrow_right_black"), for: .normal)
        
        backgroundView.addSubview(sitesView)
        sitesView.centerY(inView: backgroundView)
        sitesView.anchor(left: backgroundView.leftAnchor, paddingLeft: view.frame.size.width * 0.05, width: view.frame.size.width * 0.37, height: 30)
        
        backgroundView.addSubview(goButton)
        goButton.centerY(inView: backgroundView)
        goButton.anchor(right: backgroundView.rightAnchor, paddingRight: view.frame.size.width * 0.05)
        
        backgroundView.addSubview(selectAllView)
        selectAllView.centerY(inView: backgroundView)
        selectAllView.anchor(left: sitesView.rightAnchor, right: goButton.leftAnchor, paddingLeft: 10, paddingRight: 8, height: 30)
        
    }
    
    func setupNavigationBar() {
        title = "Site Overview"
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
    
}
