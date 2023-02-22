//
//  ChartsViewCell.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 21/02/23.
//

import UIKit
import Charts


class ChartsViewCell: UITableViewCell, ChartViewDelegate {
    
    static let identifier = "ChartsViewCell"
    public var isPieChartEnabled: Bool = true
    var barChartHidden: Bool!

    let pieChart = PieChartView()
    let barChart = BarChartView()
   
    
    private let backToStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back to Status", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 255, green: 204, blue: 0)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.isHidden = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(backToStatusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let grayView: UIView = {
        let grayView = UIView()
        grayView.backgroundColor = UIColor.rgb(red: 35, green: 35, blue: 35)
        grayView.layer.borderWidth = 2.0
        grayView.layer.borderColor = UIColor.lightGray.cgColor
        return grayView
    }()
    
    //header icons
    private let headingIcon: UIImageView = {
        let iv = UIImageView().createIcon(dimension: 30, imageName: "ic_equipment")
        return iv
    }()
    
    private let heading: UILabel = {
        let label = UILabel()
        label.text = "Equipment details"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    
    
    private let editIcon: UIImageView = {
        let iv = UIImageView().createIcon(dimension: 30, imageName: "ic_edit")
        return iv
    }()
    
    private let headingInfo: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Total: 20252156"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    //Selectors
    @objc func backToStatusButtonTapped() {
    
        if isPieChartEnabled
        {
            barChartHidden = false
            barChart.isHidden = false
            barChart.animate(yAxisDuration: 1)
            backToStatusButton.isHidden = true
        }
        else
        {
            barChart.isHidden = true
            barChartHidden = true
            pieChart.isHidden = false
            pieChart.animate(yAxisDuration: 1)
        }
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 2, bottom: 20, right: 2))
        if isPieChartEnabled {
            setupBarChart(buttonHidden: true)
        } else {
            setupPieChart()
        }
        

    }
    
    
    func setupPieChart() {
        
        pieChart.delegate = self
        pieChart.legend.enabled = true
        pieChart.legend.horizontalAlignment = .center
        pieChart.legend.verticalAlignment = .bottom
        pieChart.legend.font = UIFont.systemFont(ofSize: 13)
 
        pieChart.drawEntryLabelsEnabled = false
        
        var entries = [PieChartDataEntry]()
        entries.append(PieChartDataEntry(value: Double(309), label: "OK"))
            entries.append(PieChartDataEntry(value: Double(191), label: "GOOD"))
        entries.append(PieChartDataEntry(value: Double(47), label: "BAD"))
  
        
        
        pieChart.drawHoleEnabled = false
        pieChart.animate(yAxisDuration: 1)
//        pieChart.isUserInteractionEnabled = false
        
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        set.selectionShift = 0
        set.valueFont = UIFont.systemFont(ofSize: 20)
        set.label = ""
        
      
        
        let data = PieChartData(dataSet: set)
        pieChart.data = data
        
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        data.setValueFormatter(formatter)
        
      
        contentView.addSubview(pieChart)
        pieChart.anchor(top: grayView.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingBottom: 12)
        
    }
    
    func setupBarChart(buttonHidden: Bool) {
        barChart.delegate = self
        barChart.legend.enabled = false
        barChart.xAxis.labelPosition = .bottom
        barChart.rightAxis.drawLabelsEnabled = false
        barChart.xAxis.drawGridLinesEnabled = false
        barChart.rightAxis.enabled = false
    
        barChart.leftAxis.gridColor = .clear
        barChart.xAxis.labelFont = UIFont.systemFont(ofSize: 13)
        barChart.leftAxis.labelFont = UIFont.systemFont(ofSize: 13)
        backToStatusButton.isHidden = buttonHidden
        
        var entries = [BarChartDataEntry]()
        entries.append(BarChartDataEntry(x: Double(1), y: Double(5)))
        entries.append(BarChartDataEntry(x: Double(2), y: Double(4)))
        entries.append(BarChartDataEntry(x: Double(3), y: Double(3)))
        entries.append(BarChartDataEntry(x: Double(4), y: Double(2)))
        entries.append(BarChartDataEntry(x: Double(5), y: Double(1)))
//        entries.append(BarChartDataEntry(x: Double(6), y: Double(5)))
//        entries.append(BarChartDataEntry(x: Double(7), y: Double(4)))
//        entries.append(BarChartDataEntry(x: Double(8), y: Double(3)))
//        entries.append(BarChartDataEntry(x: Double(9), y: Double(2)))
//        entries.append(BarChartDataEntry(x: Double(10), y: Double(1)))
//        entries.append(BarChartDataEntry(x: Double(11), y: Double(5)))
        let set = BarChartDataSet(entries: entries)
        set.valueFont = UIFont.systemFont(ofSize: 13)
        set.colors = ChartColorTemplates.joyful()

        
        let data = BarChartData(dataSet: set)
        data.barWidth = 0.7
        barChart.data = data
        
//        let scrollView = UIScrollView()
//        scrollView.backgroundColor = .red
//        contentView.addSubview(scrollView)
//        scrollView.showsHorizontalScrollIndicator = true
//        scrollView.anchor(top: grayView.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8)
//        scrollView.contentSize = CGSize(width: 11 * 0.7, height: scrollView.layer.frame.height)

        contentView.addSubview(barChart)
        barChart.anchor(top: grayView.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8)

        barChart.addSubview(backToStatusButton)
        backToStatusButton.anchor(top: barChart.topAnchor, right: barChart.rightAnchor, paddingTop: 4, paddingRight: 8, width: 120, height: 40)
        
    
    }
    
    func setupUI() {
        contentView.backgroundColor = UIColor.rgb(red: 26, green: 26, blue: 26)
        contentView.layer.borderWidth = 2.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        

        contentView.addSubview(grayView)
        grayView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, height: 60)
        
        contentView.addSubview(headingIcon)
        headingIcon.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, paddingTop: 15, paddingLeft: 15)
        
        contentView.addSubview(heading)
        heading.anchor(top: contentView.topAnchor, left: headingIcon.rightAnchor, paddingTop: 20, paddingLeft: 15)
        
        
        contentView.addSubview(headingInfo)
        headingInfo.anchor(top: contentView.topAnchor, right: contentView.rightAnchor, paddingTop: 24, paddingRight: 15)
        contentView.addSubview(editIcon)
        editIcon.anchor(top: contentView.topAnchor, right: headingInfo.leftAnchor, paddingTop: 15, paddingRight: 10)
        
        
    }
    
}

extension ChartsViewCell {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        if !isPieChartEnabled {
            print("pie chart value selected")
            pieChart.isHidden = true
           setupBarChart(buttonHidden: false)
            barChart.animate(yAxisDuration: 1)
            if barChartHidden == true {
                barChart.isHidden = false
                barChartHidden = false
            }
        
        } else {
            print("BAR chart value selected")
            setupBarChart(buttonHidden: false)
            chartView.highlightValues(nil)
            barChart.animate(yAxisDuration: 1)
            if barChartHidden == true {
                barChart.isHidden = false
                barChartHidden = false
            }
        }
    }
}


