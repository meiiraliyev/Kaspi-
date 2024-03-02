//
//  File.swift
//  KaspiApp
//
//  Created by Meiir on 25.02.2024.
//

import Foundation
import UIKit
import CoreData

class TransactionPage: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberField.delegate = self
        transferField.delegate = self
        commentField.delegate = self
        hideKeyboardWhenTappedAround()
        se()
        DispatchQueue.global().async {
            self.getSavedBalance()
        }
    }
    
    let balanceKey: String = "balanceKey"
    
    func saveBalance(){
        if let encodedData = try? JSONEncoder().encode(balance){
            UserDefaults.standard.set(encodedData, forKey: balanceKey)
        }
    }
    
    func getSavedBalance(){
        guard
            let data = UserDefaults.standard.data(forKey: balanceKey),
            let savedBalance = try? JSONDecoder().decode(Int.self, from: data)
        else {return}
        self.balance = savedBalance
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveItems(){
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    var phonNumber = ""
    var amountOfMoney = ""{
        didSet{
            transactionButton.setTitle("Перевести \(amountOfMoney) ₸", for: .normal)
        }
    }
    var comment = ""

    var balance = 48500 {
        didSet{
            currentAmountLabel.text = String(balance)
            saveBalance()
        }
    }

    var gold: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "gold"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goldButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func goldButtonTapped(){
        balance += 100000
    }
    
    var strelka: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "strelka"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var contact: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "contact"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var com1Button: UIButton = {
        let button = UIButton()
        button.setTitle("Рахмет!", for: .normal)
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        button.setTitleColor(UIColor(rgb: 0x909090), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(com1ButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func com1ButtonTapped(){
    }
    
    var com2Button: UIButton = {
        let button = UIButton()
        button.setTitle("За обед", for: .normal)
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.setTitleColor(UIColor(rgb: 0x909090), for: .normal)
        button.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var com3Button: UIButton = {
        let button = UIButton()
        button.setTitle("Возвращаю :)", for: .normal)
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.setTitleColor(UIColor(rgb: 0x909090), for: .normal)
        button.layer.borderColor = UIColor(rgb: 0x909090).cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var clientImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "clientImage")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var label : UILabel = {
        let label = UILabel( )
        label.text = "Hello world"
        label.textColor = .red
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var goldLabel : UILabel = {
        let label = UILabel( )
        label.text = "Kaspi Gold"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var currentAmountLabel : UILabel = {
        let label = UILabel( )
        label.text = String(balance)
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    let phoneNumberField: UITextField = {
        let tf =  UITextField()
        tf.backgroundColor = .white
        tf.text = "Телефон получателя"
        tf.font = UIFont.systemFont(ofSize: 18.0)
        tf.textColor = UIColor(rgb: 0x909090)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let commentField: UITextField = {
        let tf =  UITextField()
        tf.backgroundColor = .white
        tf.text = "Сообщение получателю"
        tf.font = UIFont.systemFont(ofSize: 18.0)
        tf.textColor = UIColor(rgb: 0x909090)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var commissionLabel : UILabel = {
        let label = UILabel( )
        label.text = "Комиссия 0 ₸"
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor(rgb: 0x909090)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()    
    
    let transferField: UITextField = {
        let tf =  UITextField()
        tf.backgroundColor = .white
        tf.text = "0 ₸"
        tf.font = UIFont.systemFont(ofSize: 32.0)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var itemsView : UIView = {
        let view = UIView( )
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var itemsView2 : UIView = {
        let view = UIView( )
        view.backgroundColor = UIColor(rgb: 0xE0E0E0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var phonNumberView : UIView = {
        let view = UIView( )
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var amountView : UIView = {
        let view = UIView( )
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var commentView : UIView = {
        let view = UIView( )
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    var toTransfer = false
    
    var transactionButton : UIButton = {
        let button = UIButton( )
        button.backgroundColor = UIColor(rgb: 0x0089D1)
        button.setTitle("Перевести 0 ₸", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(transactionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func transactionButtonTapped(){
        print("transactionButton is tapped")
        toTransfer = true
        phoneNumberField.text="Телефон получателя"
        commentField.text="Сообщение получателю"
        transferField.text="0 ₸"

        let transaction = TransactionData(context: context)
        transaction.phoneNumber = phonNumber
        transaction.amount = amountOfMoney
        transaction.message = "Рахмет"
        transaction.date = Date()
        
        self.saveData()
        balance -= Int(amountOfMoney) ?? 0
        print(phonNumber)
        print(comment)
        print(amountOfMoney)
    }
    
    func saveData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            try context.save()
        } catch {
            print("error saving context  \(error) ")
        }
    }
    
    var phonButton : UIButton = {
        let button = UIButton( )
        button.setTitle("Телефон", for: .normal)
        button.backgroundColor = UIColor(rgb: 0xEE4A3D)
        button.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor(rgb: 0xEE4A3D).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(phonButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var cardButton : UIButton = {
        let button = UIButton( )
        button.setTitle("Карта", for: .normal)
        button.backgroundColor = UIColor(rgb: 0xFFFFFF)
        button.setTitleColor(UIColor(rgb: 0xEE4A3D), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor(rgb: 0xEE4A3D).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cardButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var qrButton : UIButton = {
        let button = UIButton( )
        button.setTitle("Каспи QR", for: .normal)
        button.backgroundColor = UIColor(rgb: 0xFFFFFF)
        button.setTitleColor(UIColor(rgb: 0xEE4A3D), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor(rgb: 0xEE4A3D).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(qrButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func phonButtonTapped(){
        numToShow = 1
        updateBackgrounfOfTheButton()
        print("phonButton is tapped")
    }
    
    @objc private func cardButtonTapped(){
        numToShow = 2
        updateBackgrounfOfTheButton()
        print("cardButton is tapped")
    }
    
    @objc private func qrButtonTapped(){
        numToShow = 3
        updateBackgrounfOfTheButton()
        print("qrButton is tapped")
    }
    
    private var numToShow = 1

    func updateBackgrounfOfTheButton() {
        if numToShow == 1{
            phonButton.backgroundColor = UIColor(rgb: 0xEE4A3D)
            phonButton.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
            
            cardButton.backgroundColor = UIColor(rgb: 0xFFFFFF)
            cardButton.setTitleColor(UIColor(rgb: 0xEE4A3D), for: .normal)
            
            qrButton.backgroundColor = UIColor(rgb: 0xFFFFFF)
            qrButton.setTitleColor(UIColor(rgb: 0xEE4A3D), for: .normal)
        } else if numToShow == 2 {
            phonButton.backgroundColor = UIColor(rgb: 0xFFFFFF)
            phonButton.setTitleColor(UIColor(rgb: 0xEE4A3D), for: .normal)
            
            cardButton.backgroundColor = UIColor(rgb: 0xEE4A3D)
            cardButton.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
            
            qrButton.backgroundColor = UIColor(rgb: 0xFFFFFF)
            qrButton.setTitleColor(UIColor(rgb: 0xEE4A3D), for: .normal)
        } else {
            phonButton.backgroundColor = UIColor(rgb: 0xFFFFFF)
            phonButton.setTitleColor(UIColor(rgb: 0xEE4A3D), for: .normal)
            
            cardButton.backgroundColor = UIColor(rgb: 0xFFFFFF)
            cardButton.setTitleColor(UIColor(rgb: 0xEE4A3D), for: .normal)
            
            qrButton.backgroundColor = UIColor(rgb: 0xEE4A3D)
            qrButton.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        }
    }
    
    func se(){
        view.backgroundColor = UIColor(rgb: 0xE0E0E0)
        view.addSubview(itemsView)
        itemsView.addSubview(goldLabel)
        itemsView.addSubview(gold)
        
        view.addSubview(itemsView2)
        itemsView2.addSubview(phonButton)
        itemsView2.addSubview(cardButton)
        itemsView2.addSubview(qrButton)
        
        view.addSubview(strelka)
        itemsView.addSubview(currentAmountLabel)
        view.addSubview(phonNumberView)
        phonNumberView.addSubview(phoneNumberField)
        phonNumberView.addSubview(contact)
        view.addSubview(amountView)
        amountView.addSubview(transferField)
        view.addSubview(commentView)
        view.addSubview(com1Button)
        view.addSubview(com2Button)
        view.addSubview(com3Button)
        view.addSubview(clientImage)
        commentView.addSubview(commentField)
        view.addSubview(transactionButton)
        view.addSubview(commissionLabel)
        
        NSLayoutConstraint.activate([
            itemsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            itemsView.heightAnchor.constraint(equalToConstant: 76),
            itemsView.widthAnchor.constraint(equalToConstant: 390),
            
            itemsView2.topAnchor.constraint(equalTo: itemsView.bottomAnchor, constant: 0),
            itemsView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            itemsView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            itemsView2.heightAnchor.constraint(equalToConstant: 88),
            
            phonButton.centerYAnchor.constraint(equalTo: itemsView2.centerYAnchor),
            phonButton.leadingAnchor.constraint(equalTo: itemsView2.leadingAnchor, constant: 8),
            phonButton.widthAnchor.constraint(equalToConstant: 125),
            phonButton.heightAnchor.constraint(equalToConstant: 34),
            
            cardButton.centerYAnchor.constraint(equalTo: itemsView2.centerYAnchor),
            cardButton.leadingAnchor.constraint(equalTo: phonButton.trailingAnchor, constant: 0),
            cardButton.widthAnchor.constraint(equalToConstant: 125),
            cardButton.heightAnchor.constraint(equalToConstant: 34),
            
            qrButton.centerYAnchor.constraint(equalTo: itemsView2.centerYAnchor),
            qrButton.leadingAnchor.constraint(equalTo: cardButton.trailingAnchor, constant: 0),
            qrButton.trailingAnchor.constraint(equalTo: itemsView2.trailingAnchor, constant: -8),
            qrButton.widthAnchor.constraint(equalToConstant: 125),
            qrButton.heightAnchor.constraint(equalToConstant: 34),
            
            goldLabel.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor),
            goldLabel.leadingAnchor.constraint(equalTo: itemsView.leadingAnchor, constant: 75),
            
            gold.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor),
            gold.leadingAnchor.constraint(equalTo: itemsView.leadingAnchor, constant: 20),
            gold.widthAnchor.constraint(equalToConstant: 48),
            gold.heightAnchor.constraint(equalToConstant: 36),
            
            strelka.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            strelka.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 92),
            strelka.widthAnchor.constraint(equalToConstant: 24),
            strelka.heightAnchor.constraint(equalToConstant: 24),
            
            currentAmountLabel.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor),
            currentAmountLabel.trailingAnchor.constraint(equalTo: itemsView.trailingAnchor, constant: -25),
            
            phonNumberView.topAnchor.constraint(equalTo: itemsView2.bottomAnchor),
            phonNumberView.heightAnchor.constraint(equalToConstant: 80),
            phonNumberView.widthAnchor.constraint(equalToConstant: 390),
            
            phoneNumberField.centerYAnchor.constraint(equalTo: phonNumberView.centerYAnchor),
            phoneNumberField.leadingAnchor.constraint(equalTo: phonNumberView.leadingAnchor, constant: 25),
            
            amountView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            amountView.heightAnchor.constraint(equalToConstant: 85),
            amountView.widthAnchor.constraint(equalToConstant: 390),
            
            transferField.centerYAnchor.constraint(equalTo: amountView.centerYAnchor),
            transferField.centerXAnchor.constraint(equalTo: amountView.centerXAnchor),
            
            commentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 412),
            commentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            commentView.heightAnchor.constraint(equalToConstant: 92),
            commentView.widthAnchor.constraint(equalToConstant: 270),
            
            com1Button.topAnchor.constraint(equalTo: commentView.bottomAnchor, constant: 10),
            com1Button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            com1Button.heightAnchor.constraint(equalToConstant: 26),
            com1Button.widthAnchor.constraint(equalToConstant: 62),
            
            com2Button.topAnchor.constraint(equalTo: commentView.bottomAnchor, constant: 10),
            com2Button.leadingAnchor.constraint(equalTo: com1Button.trailingAnchor, constant: 2),
            com2Button.heightAnchor.constraint(equalToConstant: 26),
            com2Button.widthAnchor.constraint(equalToConstant: 62),
            
            com3Button.topAnchor.constraint(equalTo: commentView.bottomAnchor, constant: 10),
            com3Button.leadingAnchor.constraint(equalTo: com2Button.trailingAnchor, constant: 2),
            com3Button.heightAnchor.constraint(equalToConstant: 26),
            com3Button.widthAnchor.constraint(equalToConstant: 94),
            
            clientImage.bottomAnchor.constraint(equalTo: commentView.bottomAnchor),
            clientImage.leadingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: 15),
            clientImage.heightAnchor.constraint(equalToConstant: 40),
            clientImage.widthAnchor.constraint(equalToConstant: 40),
            
            commentField.centerYAnchor.constraint(equalTo: commentView.centerYAnchor),
            commentField.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 25),
            
            contact.centerYAnchor.constraint(equalTo: phonNumberView.centerYAnchor),
            contact.trailingAnchor.constraint(equalTo: phonNumberView.trailingAnchor, constant: -20),
            contact.widthAnchor.constraint(equalToConstant: 45),
            contact.heightAnchor.constraint(equalToConstant: 45),
            
            transactionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
            transactionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            transactionButton.heightAnchor.constraint(equalToConstant: 60),
            transactionButton.widthAnchor.constraint(equalToConstant: 330),
            
            commissionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            commissionLabel.bottomAnchor.constraint(equalTo: transactionButton.topAnchor, constant: -15),
        ])
    }
}

extension TransactionPage: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField == phoneNumberField {
            if let text = textField.text as NSString? {
                let newText = text.replacingCharacters(in: range, with: string)
                phoneNumberField.textColor = .black
                phonNumber = newText                
            }
        }
        
        if textField == commentField {
            if let text = textField.text as NSString? {
                let newText = text.replacingCharacters(in: range, with: string)
                commentField.textColor = .black
                comment = newText
            }
        }

        if textField == transferField {
            if let text = textField.text as NSString? {
                let newText = text.replacingCharacters(in: range, with: string)
                transferField.textColor = .black
                amountOfMoney = newText
            }
        }
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        if textField == phoneNumberField {
            textField.text=""
        }
        if textField == commentField {
            textField.text=""
        }
        if textField == transferField {
            textField.text=""
        }
        
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}

