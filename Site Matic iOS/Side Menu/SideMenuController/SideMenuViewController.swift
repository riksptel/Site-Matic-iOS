//
//  SideMenuViewController.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 15/02/23.
//

import UIKit

final class SideMenuViewController: UIViewController {
    
    private let employeeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Employee Name"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let employeeEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "xyz@gmail.com"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private let employeeDepartmentLabel: UILabel = {
        let label = UILabel()
        label.text = "Department"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    
    private let userIcon: UIImageView = {
        let userIcon = UIImageView()
        userIcon.clipsToBounds = true
        userIcon.setDimensions(width: 50, height: 50)
        userIcon.layer.cornerRadius = 25
        userIcon.backgroundColor = .red
        userIcon.contentMode = .scaleAspectFit
        return userIcon
    }()

    private lazy var headerView: UIView = {
        let view = UIView()

        view.addSubview(userIcon)
        userIcon.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 15, paddingBottom: 15)
        view.backgroundColor = UIColor.rgb(red: 20, green: 20, blue: 20)
        
        let stackView = UIStackView(arrangedSubviews: [employeeNameLabel, employeeEmailLabel, employeeDepartmentLabel])
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.anchor(left: userIcon.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 15, paddingBottom: 15, paddingRight: 15, height: 50)
        
        return view
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22.5)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)

        return button
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 60
        return tableView
    }()

    private var sideMenuView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var screenWidth: CGFloat {
        view.frame.size.width
    }

    private var leadingConstraint: NSLayoutConstraint!
    private var shadowColor: UIColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 0.5)
    private var sideMenuItems: [SideMenuItem] = [SideMenuItem(name: "Home"), SideMenuItem(name: "Site Overview"), SideMenuItem(name: "DMS"), SideMenuItem(name: "Reports"), SideMenuItem(name: "My Locations"), SideMenuItem(name: "Preventive maintenance"), SideMenuItem(name: "Chart Permission"), SideMenuItem(name: "Administrations")]
    
    weak var delegate: SideMenuDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        view.backgroundColor = .clear
        view.frame.origin.x = -screenWidth
        addSubviews()
        configureTableView()
        configureTapGesture()
    }

    private func addSubviews() {
        view.addSubview(sideMenuView)
        sideMenuView.addSubview(headerView)
        view.addSubview(logoutButton)
        sideMenuView.addSubview(tableView)
        configureConstraints()
    }

    private func configureConstraints() {
        sideMenuView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingConstraint = sideMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -view.frame.size.width)
        leadingConstraint.isActive = true
        sideMenuView.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.6).isActive = true
        sideMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        //making the headerView
        
        headerView.topAnchor.constraint(equalTo: sideMenuView.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
       
        logoutButton.anchor(left: sideMenuView.leftAnchor, bottom: sideMenuView.bottomAnchor, right: sideMenuView.rightAnchor, height: 60)

        tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: logoutButton.topAnchor).isActive = true
    }

    private func configureTableView() {
        tableView.backgroundColor = UIColor.rgb(red: 39, green: 39, blue: 39)
        tableView.register(SideMenuItemCell.self, forCellReuseIdentifier: SideMenuItemCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.bounces = false
    }

    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func tapped() {
        hide()
    }

    func show() {
        self.view.frame.origin.x = 0
        self.view.backgroundColor = self.shadowColor
        UIView.animate(withDuration: 0.5) {
            self.leadingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }

    func hide() {
        self.view.backgroundColor = .clear
        UIView.animate(withDuration: 0.5) {
            self.leadingConstraint.constant = -self.screenWidth
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.view.frame.origin.x = -self.screenWidth
        }
    }
}

extension SideMenuViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let view = touch.view else { return false }
        if view === headerView || view.isDescendant(of: tableView) {
            return false
        }
        return true
    }
}

extension SideMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sideMenuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuItemCell.identifier, for: indexPath) as? SideMenuItemCell else {
            fatalError("Could not dequeue cell")
        }
        let item = sideMenuItems[indexPath.row]
        cell.configureCell(icon: nil, text: item.name)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
//        let item = sideMenuItems[indexPath.row]
//        delegate?.itemSelected(item: item.viewController)
    }
}

