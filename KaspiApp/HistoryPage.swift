//
//  HistoryPage.swift
//  KaspiApp
//
//  Created by Meiir on 26.02.2024.
//

import Foundation
import UIKit
import CoreData

class HistoryPage: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    var contacts = [
        "87083721190": "Мейир А.",
        "87077807209": "Алихан О.",
        "87470806306": "Мадияр Е.",
        "87073869500": "Алишер А.",
        "87077090727": "Гуланар Ы.",
        "87778090727": "Айтбай А.",
        "87071719922": "Галия В",
        "87772055529": "Досжан А.",
        "87019859617": "Амина Д.",
        "87072154232": "Аружан А.",
        "87058092635": "Алдияр Е.",
        "87052076902": "Аян И.",
        "87759239527": "Санжар И.",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    var perevody = [TransactionData](){
        didSet{
            historyTableView.reloadData()
        }
    }
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func loadItems(){
        let request : NSFetchRequest<TransactionData> = TransactionData.fetchRequest()
        do{
            perevody = try context.fetch(request)
        } catch {
            print("error fetching data from context \(error) ")
        }
    }
    
    lazy var searchBar: UIView = {
        let v = CustomSearchBar()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.viewControllerDelegate = self
        return v
    }()
    
    var topView : UIView = {
        let view = UIView( )
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var myTransactionsButton : UIButton = {
        let button = UIButton( )
        button.setTitle("МОИ ПЕРЕВОДЫ", for: .normal)
        button.backgroundColor = UIColor(rgb: 0xFFFFFF)
        button.setTitleColor(UIColor(rgb: 0xEE4A3D), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(myTransactionsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func myTransactionsButtonTapped(){
        toShowHistory = false
        updateBackgrounfOfTheButton()
        toShowTransactionsPage()
        print("myTransactionsButton is tapped")
    }
    
    var historyButton : UIButton = {
        let button = UIButton( )
        button.setTitle("ИСТОРИЯ", for: .normal)
        button.backgroundColor = UIColor(rgb: 0xEE4A3D)
        button.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(historyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func historyButtonTapped(){
        loadItems()
        toShowHistory = true
        updateBackgrounfOfTheButton()
        toShowHistoryPage()
        print("historyButton is tapped")
    }
    
    private var toShowHistory = true

    func updateBackgrounfOfTheButton() {
        if toShowHistory == true{
            historyButton.backgroundColor = UIColor(rgb: 0xEE4A3D)
            historyButton.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
            myTransactionsButton.backgroundColor = UIColor(rgb: 0xFFFFFF)
            myTransactionsButton.setTitleColor(UIColor(rgb: 0xEE4A3D), for: .normal)
        } else {
            myTransactionsButton.backgroundColor = UIColor(rgb: 0xEE4A3D)
            myTransactionsButton.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
            historyButton.backgroundColor = UIColor(rgb: 0xFFFFFF)
            historyButton.setTitleColor(UIColor(rgb: 0xEE4A3D), for: .normal)
        }
    }
    
    var viewForSearch : UIView = {
        let view = UIView( )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var viewForCalendar : UIView = {
        let view = UIView( )
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var calendarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "calendar"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(calendarButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    @objc private func calendarButtonPressed() -> Void{
        print(perevody)
    }
    
    var dateLabel: UILabel = {
        var label = UILabel()
        label.text = "9 декабря - 16 декабря"
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints  = false
        return label
    }()
    
    let transactionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 66
        tableView.backgroundColor = .systemGray
        return tableView
    }()
    let cellContents = [("perevod", "Между своими счетами"), ("contact", "Клиенту Kaspi"), ("card", "Карта другого банка"), ("contact", "Международные переводы"), ("qr", "Kaspi QR")]
    
    let historyTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(rgb: 0xE0E0E0)
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 128
        return tableView
    }()
    
    func toShowHistoryPage(){
        print("toShowHistoryPage")
        transactionsTableView.isHidden = true
        viewForSearch.isHidden = false
        searchBar.isHidden = false
        viewForCalendar.isHidden = false
        calendarButton.isHidden = false
        dateLabel.isHidden = false
        historyTableView.isHidden = false
    }
    
    func toShowTransactionsPage(){
        print("toShowTransactionsPage")
        viewForSearch.isHidden = true
        searchBar.isHidden = true
        viewForCalendar.isHidden = true
        calendarButton.isHidden = true
        dateLabel.isHidden = true
        historyTableView.isHidden = true
        transactionsTableView.isHidden = false
    }
    
    func setupUI(){
        view.backgroundColor = UIColor(rgb: 0xE0E0E0)
        view.addSubview(topView)
        topView.addSubview(myTransactionsButton)
        topView.addSubview(historyButton)
        view.addSubview(viewForSearch)
        viewForSearch.addSubview(searchBar)
        view.addSubview(viewForCalendar)
        viewForCalendar.addSubview(calendarButton)
        viewForCalendar.addSubview(dateLabel)
        view.addSubview(historyTableView)
        
        historyTableView.dataSource = self
        historyTableView.delegate = self
        historyTableView.register(HistoryCustomCell.self, forCellReuseIdentifier: "historyCell")
        
        view.addSubview(transactionsTableView)
        transactionsTableView.isHidden = true
        transactionsTableView.dataSource = self
        transactionsTableView.delegate = self
        transactionsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topView.heightAnchor.constraint(equalToConstant: 48),
            
            myTransactionsButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            myTransactionsButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 8),
            myTransactionsButton.trailingAnchor.constraint(equalTo: historyButton.leadingAnchor, constant: 0),
            myTransactionsButton.widthAnchor.constraint(equalToConstant: 187),
            myTransactionsButton.heightAnchor.constraint(equalToConstant: 34),
            
            historyButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            historyButton.leadingAnchor.constraint(equalTo: myTransactionsButton.trailingAnchor, constant: 0),
            historyButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8),
            historyButton.widthAnchor.constraint(equalToConstant: 187),
            historyButton.heightAnchor.constraint(equalToConstant: 34),
            
            transactionsTableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            transactionsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transactionsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            transactionsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            viewForSearch.topAnchor.constraint(equalTo: topView.bottomAnchor),
            viewForSearch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewForSearch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            viewForSearch.heightAnchor.constraint(equalToConstant: 64),
            
            searchBar.centerXAnchor.constraint(equalTo: viewForSearch.centerXAnchor),
            searchBar.centerYAnchor.constraint(equalTo: viewForSearch.centerYAnchor),
            
            viewForCalendar.topAnchor.constraint(equalTo: viewForSearch.bottomAnchor),
            viewForCalendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewForCalendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            viewForCalendar.heightAnchor.constraint(equalToConstant: 57),
            
            calendarButton.centerYAnchor.constraint(equalTo: viewForCalendar.centerYAnchor),
            calendarButton.leadingAnchor.constraint(equalTo: viewForCalendar.leadingAnchor, constant: 12),
            calendarButton.widthAnchor.constraint(equalToConstant: 24),
            calendarButton.heightAnchor.constraint(equalToConstant: 24),
            
            dateLabel.centerYAnchor.constraint(equalTo: viewForCalendar.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: calendarButton.trailingAnchor, constant: 20),
            
            historyTableView.topAnchor.constraint(equalTo: viewForCalendar.bottomAnchor, constant: 0),
            historyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            historyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            historyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == historyTableView {
            return perevody.count
        } else if tableView == transactionsTableView {
            return cellContents.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == historyTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryCustomCell
            let obj = perevody[indexPath.row]
            cell.nameLabel.text  = contacts[obj.phoneNumber ?? "877777777"] ?? "Кайрат Н."
            cell.amountLabel.text = obj.amount
            if let transactionDate = obj.date {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "ru_RU")
                dateFormatter.dateFormat = "d MMMM"
                
                let dateString = dateFormatter.string(from: transactionDate)
                cell.dateLabel.text = dateString
            } else {
                print("Transaction date is nil") // Handle the case where transaction date is nil
            }

            return cell
        } else if tableView == transactionsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
            let (imageName, labelText) = cellContents[indexPath.row]
            cell.customImageView.image = UIImage(named: imageName)
            cell.customLabel.text = labelText
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == transactionsTableView {
            if indexPath.row == 1 {
                transactionsTableView.deselectRow(at: indexPath, animated: true)
                let transactionPage = TransactionPage()
                navigationController?.pushViewController(transactionPage, animated: true)
            }
        }
    }
}
