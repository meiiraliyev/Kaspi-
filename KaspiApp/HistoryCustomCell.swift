//
//  TransactionCustomCell.swift
//  KaspiApp
//
//  Created by Meiir on 28.02.2024.
//

import UIKit

class HistoryCustomCell: UITableViewCell {
    var dataView : UIView = {
        let view = UIView( )
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var topView : UIView = {
        let view = UIView( )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let image: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Avatarka")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 16
        img.clipsToBounds = true
        return img
    }()
    
    var strelka: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "strelka2"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let kaspiLabel: UILabel = {
        let label = UILabel()
        label.text = "Kaspi Gold"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Батыр Ш."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "1 250,00 ₸"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let klientuLabel: UILabel = {
        let label = UILabel()
        label.text = "Клиенту Kaspi"
        label.textColor = UIColor(rgb: 0x909090)
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "15 Декабря"
        label.textColor = UIColor(rgb: 0x909090)
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = UIColor(rgb: 0xE0E0E0)
        contentView.addSubview(topView)
        topView.addSubview(dateLabel)
        contentView.addSubview(dataView)
        dataView.addSubview(image)
        dataView.addSubview(kaspiLabel)
        dataView.addSubview(nameLabel)
        dataView.addSubview(amountLabel)
        dataView.addSubview(klientuLabel)
        dataView.addSubview(strelka)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            topView.heightAnchor.constraint(equalToConstant: 40),
            
            dateLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16),
            
            dataView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0),
            dataView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            dataView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            dataView.heightAnchor.constraint(equalToConstant: 88),
            
            image.topAnchor.constraint(equalTo: dataView.topAnchor, constant: 15),
            image.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 16),
            image.widthAnchor.constraint(equalToConstant: 40),
            image.heightAnchor.constraint(equalToConstant: 40),
            
            strelka.centerYAnchor.constraint(equalTo: dataView.centerYAnchor),
            strelka.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            strelka.widthAnchor.constraint(equalToConstant: 24),
            strelka.heightAnchor.constraint(equalToConstant: 24),
            
            nameLabel.centerYAnchor.constraint(equalTo: dataView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: strelka.trailingAnchor, constant: 4),
            
            kaspiLabel.topAnchor.constraint(equalTo: dataView.topAnchor, constant: 12),
            kaspiLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            
            amountLabel.topAnchor.constraint(equalTo: dataView.topAnchor, constant: 15),
            amountLabel.trailingAnchor.constraint(equalTo: dataView.trailingAnchor, constant: -16),
            
            klientuLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            klientuLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
        ])
    }
}

