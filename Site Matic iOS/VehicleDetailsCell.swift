//
//  VehicleDetailsCell.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 12/02/23.
//

import UIKit

class VehicleDetailsCell: UITableViewCell {
    
    static let identifier = "VehicleDetailsCell"
    
    //header icons
    private let equipmentIcon: UIImageView = {
        let iv = UIImageView().createIcon(dimension: 17, imageName: "ic_equipment")
        return iv
    }()
    
    private let editIcon: UIImageView = {
        let iv = UIImageView().createIcon(dimension: 17, imageName: "ic_edit")
        return iv
    }()
    
    private let mapIcon: UIImageView = {
        let iv = UIImageView().createIcon(dimension: 17, imageName: "ic_map")
        return iv
    }()

    //content icons
    private let unitIcon: UIImageView = {
        let iv = UIImageView().createIcon(dimension: 17, imageName: "ic_unit")
        return iv
    }()
    
    private let siteNameIcon: UIImageView = {
        let iv = UIImageView().createIcon(dimension: 17, imageName: "ic_site_name")
        return iv
    }()
    
    private let numberPlateIcon: UIImageView = {
        let iv = UIImageView().createIcon(dimension: 17, imageName: "ic_number_plate")
        return iv
    }()
    
    private let dateTimeIcon: UIImageView = {
        let iv = UIImageView().createIcon(dimension: 17, imageName: "date_time")
        return iv
    }()
    
    private let assignIcon: UIImageView = {
        let iv = UIImageView().createIcon(dimension: 17, imageName: "ic_assign")
        return iv
    }()
    
    private let alertsMessageIcon: UIImageView = {
        let iv = UIImageView().createIcon(dimension: 17, imageName: "ic_alerts_message")
        return iv
    }()
    
    private let commentsIcon: UIImageView = {
        let iv = UIImageView().createIcon(dimension: 17, imageName: "ic_comments")
        return iv
    }()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10))
    }
    
    func setupUI() {
        contentView.backgroundColor = .black
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.rgb(red: 57, green: 57, blue: 57).cgColor
        
        let grayView = UIView()
        grayView.backgroundColor = UIColor.rgb(red: 57, green: 57, blue: 57)
        contentView.addSubview(grayView)
        grayView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, height: 25)
        
        contentView.addSubview(equipmentIcon)
        equipmentIcon.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, paddingTop: 5, paddingLeft: 10)
        
        let equipmentNumberLabel = UILabel()
        equipmentNumberLabel.textColor = .white
        equipmentNumberLabel.text = "20252156"
        equipmentNumberLabel.font = UIFont.systemFont(ofSize: 12)
        
        contentView.addSubview(equipmentNumberLabel)
        equipmentNumberLabel.anchor(top: contentView.topAnchor, left: equipmentIcon.rightAnchor, paddingTop: 5, paddingLeft: 5)
        
        
        contentView.addSubview(mapIcon)
        mapIcon.anchor(top: contentView.topAnchor, right: contentView.rightAnchor, paddingTop: 5, paddingRight: 10)
        contentView.addSubview(editIcon)
        editIcon.anchor(top: contentView.topAnchor, right: mapIcon.leftAnchor, paddingTop: 5, paddingRight: 5)
        
        contentView.addSubview(unitIcon)
        unitIcon.anchor(top: equipmentIcon.bottomAnchor, left: contentView.leftAnchor, paddingTop: 15, paddingLeft: 25)
        
        let unitLabel = UILabel()
        unitLabel.textColor = .white
        unitLabel.text = "VIBRA SOIL COMPACTOR"
        unitLabel.font = UIFont.systemFont(ofSize: 9)
        
        contentView.addSubview(unitLabel)
        unitLabel.anchor(top: equipmentIcon.bottomAnchor, left: unitIcon.rightAnchor, right: contentView.rightAnchor, paddingTop: 18, paddingLeft: 5, paddingRight: 25)
        
        contentView.addSubview(siteNameIcon)
        siteNameIcon.anchor(top: unitIcon.bottomAnchor, left: contentView.leftAnchor, paddingTop: 15, paddingLeft: 25)
        
        let siteNameLabel = UILabel()
        siteNameLabel.textColor = .white
        siteNameLabel.text = "AKSO"
        siteNameLabel.font = UIFont.systemFont(ofSize: 9)
        
        contentView.addSubview(siteNameLabel)
        siteNameLabel.anchor(top: unitIcon.bottomAnchor, left: siteNameIcon.rightAnchor, paddingTop: 18, paddingLeft: 5)
        
        //horizontal data
        let numberPlateLabel = UILabel()
        numberPlateLabel.textColor = .white
        numberPlateLabel.text = "MH24AS2543"
        numberPlateLabel.font = UIFont.systemFont(ofSize: 9)
        
        contentView.addSubview(numberPlateLabel)
        numberPlateLabel.anchor(top: unitIcon.bottomAnchor, right: contentView.rightAnchor, paddingTop: 18, paddingRight: 25)
        
        
        contentView.addSubview(numberPlateIcon) //horizontal
        numberPlateIcon.anchor(top: unitIcon.bottomAnchor, right: numberPlateLabel.leftAnchor, paddingTop: 15, paddingRight: 5)
        
        contentView.addSubview(dateTimeIcon)
        dateTimeIcon.anchor(top: siteNameIcon.bottomAnchor, left: contentView.leftAnchor, paddingTop: 15, paddingLeft: 25)
        
        let dateTimeLabel = UILabel()
        dateTimeLabel.textColor = .white
        dateTimeLabel.text = "23/11/22 04:13:13 AM"
        dateTimeLabel.font = UIFont.systemFont(ofSize: 9)
        
        contentView.addSubview(dateTimeLabel)
        dateTimeLabel.anchor(top: siteNameIcon.bottomAnchor, left: dateTimeIcon.rightAnchor, paddingTop: 18, paddingLeft: 5)
        
        //horizontal data
        let assignLabel = UILabel()
        assignLabel.textColor = .white
        assignLabel.text = "Loram ipsum"
        assignLabel.font = UIFont.systemFont(ofSize: 9)
        
        contentView.addSubview(assignLabel)
        assignLabel.anchor(top: numberPlateIcon.bottomAnchor, right: contentView.rightAnchor, paddingTop: 18, paddingRight: 25, width: 60)
        
        contentView.addSubview(assignIcon) //horizontal
        assignIcon.anchor(top: siteNameIcon.bottomAnchor, right: assignLabel.leftAnchor, paddingTop: 15, paddingRight: 5)
        
        
        contentView.addSubview(alertsMessageIcon)
        alertsMessageIcon.anchor(top: dateTimeIcon.bottomAnchor, left: contentView.leftAnchor, paddingTop: 15, paddingLeft: 25)
        
        let alertsMessageLabel = UILabel()
        alertsMessageLabel.textColor = .white
        alertsMessageLabel.text = "Main battery disconnected from asset MH24AS2543 NEAR 0.01 km from Opp. Pani Tanki Akkalkot Road, Gandhinagar"
        alertsMessageLabel.numberOfLines = 2
        alertsMessageLabel.font = UIFont.systemFont(ofSize: 9)
        
        contentView.addSubview(alertsMessageLabel)
        alertsMessageLabel.anchor(top: dateTimeIcon.bottomAnchor, left: alertsMessageIcon.rightAnchor, right: contentView.rightAnchor, paddingTop: 18, paddingLeft: 5, paddingRight: 25)
        
        contentView.addSubview(commentsIcon)
        commentsIcon.anchor(top: alertsMessageIcon.bottomAnchor, left: contentView.leftAnchor, paddingTop: 15, paddingLeft: 25)
        
        let commentsLabel = UILabel()
        commentsLabel.textColor = .white
        commentsLabel.text = "23/11/22 04:13:13 AM"
        commentsLabel.font = UIFont.systemFont(ofSize: 9)
        
        contentView.addSubview(commentsLabel)
        commentsLabel.anchor(top: alertsMessageIcon.bottomAnchor, left: commentsIcon.rightAnchor, right: contentView.rightAnchor, paddingTop: 18, paddingLeft: 5, paddingRight: 25)
    }
}


