//
//  SideMenuItemCell.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 15/02/23.
//

import UIKit

final class SideMenuItemCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }

    private var itemIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 40 / 2
        return imageView
    }()

    private var itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: SideMenuItemCell.identifier)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

    private func configureView() {
        contentView.backgroundColor = UIColor.rgb(red: 39, green: 39, blue: 39)
        contentView.addSubview(itemIcon)
        contentView.addSubview(itemLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configureConstraints()
    }

    private func configureConstraints() {
        itemIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        itemIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        itemIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        itemIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22).isActive = true

        itemLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        itemLabel.leadingAnchor.constraint(equalTo: itemIcon.trailingAnchor, constant: 10).isActive = true
        itemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22).isActive = true
    }

    func configureCell(icon: UIImage?, text: String) {
        itemIcon.image = icon
        itemLabel.text = text
    }
}

