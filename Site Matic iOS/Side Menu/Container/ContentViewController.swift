//
//  ContentViewController.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 15/02/23.
//

import UIKit

class ContentViewController: UIViewController {
    weak var delegate: SideMenuDelegate?
    var barButtonImage: UIImage? = UIImage(systemName: "line.horizontal.3")
    var grayView: UIView!
    var contentView: UIView!
    
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
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .black
        scrollView.showsVerticalScrollIndicator = true
        scrollView.isDirectionalLockEnabled = true
        return scrollView
    }()
    
    
    //Helpers
    @objc func selectionButtonPressed() {
        
    }
    
    
    @objc func menuOpenerButtonPressed() {
        
    }
    
    @objc private func menuTapped() {
        delegate?.menuButtonTapped()
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
        configureView()
        setupDashboard()
    }
    
    private func configureView() {
        let barButtonItem = UIBarButtonItem(image: barButtonImage, style: .plain, target: self, action: #selector(menuTapped))
        barButtonItem.tintColor = .white
        navigationItem.setLeftBarButton(barButtonItem, animated: false)
    }
    
    func setupDashboard() {
        let stackView1 = UIStackView(arrangedSubviews: [icTotalEquipmentBtn, icActiveBtn, icInActive])
        stackView1.spacing = 5.0
        stackView1.axis = .horizontal
        stackView1.distribution = .fillEqually
        contentView.addSubview(stackView1)
        stackView1.anchor(top: grayView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 8, paddingLeft: 5, paddingRight: 8, height: 40)
        
        let stackView2 = UIStackView(arrangedSubviews: [icBreakdownBtn, icStoppedBtn, icPeopleBtn])
        stackView2.spacing = 5.0
        stackView2.axis = .horizontal
        stackView2.distribution = .fillEqually
        contentView.addSubview(stackView2)
        stackView2.anchor(top: stackView1.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 8, paddingLeft: 5, paddingRight: 8, height: 40)

        contentView.addSubview(mapView)
        mapView.anchor(top: stackView2.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 8, paddingLeft: 5, paddingRight: 8, width: view.frame.size.width, height: view.frame.size.height * 0.35)

        //Equipment view
        let equipmentDetailsView = UIView()
        equipmentDetailsView.backgroundColor = UIColor.rgb(red: 25, green: 25, blue: 25)
        //Gray view with image and text
        let equipmentDetailsTextBackgroundView = UIView()
        equipmentDetailsTextBackgroundView.backgroundColor = UIColor.rgb(red: 49, green: 49, blue: 49)

        equipmentDetailsView.addSubview(equipmentDetailsTextBackgroundView)
        equipmentDetailsTextBackgroundView.anchor(top: equipmentDetailsView.topAnchor, left: equipmentDetailsView.leftAnchor, right: equipmentDetailsView.rightAnchor, height: 45)

        let truckIconImageView = UIImageView()
        truckIconImageView.image = UIImage(named: "ic_driver_trend")
        truckIconImageView.setDimensions(width: 30, height: 30)
        truckIconImageView.layer.cornerRadius = 15

        equipmentDetailsTextBackgroundView.addSubview(truckIconImageView)
        truckIconImageView.centerY(inView: equipmentDetailsTextBackgroundView)
        truckIconImageView.anchor(left: equipmentDetailsTextBackgroundView.leftAnchor, paddingLeft: 5)

        let driverTrendLabel = UILabel()
        driverTrendLabel.text = "Driver trend"
        driverTrendLabel.font = UIFont.systemFont(ofSize: 20)
        driverTrendLabel.textColor = .white

        equipmentDetailsTextBackgroundView.addSubview(driverTrendLabel)
        driverTrendLabel.centerY(inView: equipmentDetailsTextBackgroundView)
        driverTrendLabel.anchor(left: truckIconImageView.rightAnchor, paddingLeft: 8)
        
        let showDriverTrendButton = UIButton(type: .system)
        showDriverTrendButton.backgroundColor = UIColor.rgb(red: 255, green: 204, blue: 0)
        showDriverTrendButton.setDimensions(width: 20, height: 20)
        showDriverTrendButton.layer.cornerRadius = 3
        showDriverTrendButton.setImage(UIImage(named: "driverDashboard_expand"), for: .normal)
        
        equipmentDetailsTextBackgroundView.addSubview(showDriverTrendButton)
        showDriverTrendButton.centerY(inView: equipmentDetailsTextBackgroundView)
        showDriverTrendButton.anchor(left: driverTrendLabel.rightAnchor, paddingLeft: 5)

        contentView.addSubview(equipmentDetailsView)
        equipmentDetailsView.anchor(top: mapView.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingRight: 8, height: 350)
    }
    
    
    func setupUI() {
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)

        contentView = UIView()
        contentView.backgroundColor = .black
        scrollView.addSubview(contentView)
        contentView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor)
        contentView.centerX(inView: scrollView)
        
        grayView = UIView()
        grayView.backgroundColor = UIColor.rgb(red: 45, green: 45, blue: 45)
        contentView.addSubview(grayView)
        grayView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 8, height: 50)

        let goButton = UIButton(type: .system)
        goButton.backgroundColor = UIColor.rgb(red: 255, green: 204, blue: 0)
        goButton.setDimensions(width: 30, height: 30)
        goButton.layer.cornerRadius = 4
        goButton.setImage(UIImage(named: "arrow_right_black"), for: .normal)

        grayView.addSubview(sitesView)
        sitesView.centerY(inView: grayView)
        sitesView.anchor(left: grayView.leftAnchor, paddingLeft: view.frame.size.width * 0.05, width: view.frame.size.width * 0.37, height: 30)

        grayView.addSubview(goButton)
        goButton.centerY(inView: grayView)
        goButton.anchor(right: grayView.rightAnchor, paddingRight: view.frame.size.width * 0.05)

        grayView.addSubview(selectAllView)
        selectAllView.centerY(inView: grayView)
        selectAllView.anchor(left: sitesView.rightAnchor, right: goButton.leftAnchor, paddingLeft: 10, paddingRight: 8, height: 30)
        
    }
    
    func setupNavigationBar() {
        title = "Driver Dashboard"
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .mobaGray
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.compactAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationBar.isTranslucent = false
        
        //left icons
//        let menuButton = UIButton(type: .system)
//        menuButton.setImage(UIImage(named: "menu"), for: .normal)
//        menuButton.setDimensions(width: 18, height: 18)
//        menuButton.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        
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
        
     
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: userButton), UIBarButtonItem(customView: notificationButton), UIBarButtonItem(customView: searchButton) ]
    }
    
}
