//
//  ViewController.swift
//  KaspiApp
//
//  Created by Meiir on 23.02.2024.
//

import UIKit

class ViewController: UIViewController {
    private let historyPage = HistoryPage()

    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.delegate = self
        textField2.delegate = self
        hideKeyboardWhenTappedAround()
        setupUI()
    }
    var name = "Medeu"{
        didSet{
            nameLabel.text = "    Имя: " + self.name
        }
    }
    var surname = "Pazylov"
    {
        didSet{
            surnameLabel.text = "    Фамилия: " + self.surname
        }
    }
    
    var avatarka: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0x393939)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "    Имя: " + self.name
        lb.backgroundColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    lazy var surnameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "    Фамилия: " + self.surname
        lb.backgroundColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let  textField1: UITextField = {
        let tf =  UITextField()
        tf.backgroundColor = .white
        tf.text = "    Введите имя:"
        tf.font = UIFont(name: "AppleSDGothicNeo-Heavy", size: 13)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let  textField2: UITextField = {
        let tf =  UITextField()
        tf.backgroundColor = .white
        tf.text = "    Введите фамилию:"
        tf.font = UIFont(name: "AppleSDGothicNeo-Heavy", size: 13)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var cameraButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "camera"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cameraButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var penButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pen"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(penButton1Tapped), for: .touchUpInside)
        return button
    }()
    
    var doneButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "done"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(doneButton1Tapped), for: .touchUpInside)
        return button
    }()
    
    var penButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pen"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(penButton2Tapped), for: .touchUpInside)
        return button
    }()
    
    var doneButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "done"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(doneButton2Tapped), for: .touchUpInside)
        return button
    }()
    
    var historyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(historyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func cameraButtonTapped() {
        print("Camera button is tapped")
    }
    
    @objc private func penButton1Tapped() {
        print("Pen Button1 is tapped")
        textField1.isHidden = false
        doneButton1.isHidden = false
        penButton1.isHidden = true
    }
    
    @objc private func penButton2Tapped() {
        print("Pen Button2 is tapped")
        textField2.isHidden = false
        doneButton2.isHidden = false
        penButton2.isHidden = true
    }
    
    @objc private func doneButton1Tapped() {
        print("Done button 1 is tapped")
        textField1.isHidden = true
        doneButton1.isHidden = true
        penButton1.isHidden = false
    }
    
    @objc private func doneButton2Tapped() {
        print("Done button 2 is tapped")
        textField2.isHidden = true
        doneButton2.isHidden = true
        penButton2.isHidden = false
    }
    
    @objc private func serviceButtonTapped() {
        print("serviceButtonTapped is tapped")
        let transactionPage = TransactionPage()
        navigationController?.pushViewController(transactionPage, animated: true)
    }
    
    @objc private func historyButtonTapped() {
        print("historyButtonTapped is tapped")
//        let historyPage = HistoryPage()
        navigationController?.pushViewController(historyPage, animated: true)
    }

    var icon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Avatarka")
        image.translatesAutoresizingMaskIntoConstraints  = false
        return image
    }()
    
    func setupUI() {
        view.backgroundColor = UIColor(rgb: 0xE0E0E0)
        view.addSubview(avatarka)
        avatarka.addSubview(icon)
        view.addSubview(nameLabel)
        view.addSubview(surnameLabel)
        view.addSubview(textField1)
        view.addSubview(textField2)
        view.addSubview(cameraButton)
        view.addSubview(penButton1)
        view.addSubview(penButton2)
        view.addSubview(doneButton1)
        view.addSubview(doneButton2)
        view.addSubview(historyButton)
        
        textField1.isHidden = true
        doneButton1.isHidden = true
        
        textField2.isHidden = true
        doneButton2.isHidden = true
        
        NSLayoutConstraint.activate([
                    nameLabel.topAnchor.constraint(equalTo: avatarka.bottomAnchor, constant: 15),
                    nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                    nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                    nameLabel.widthAnchor.constraint(equalToConstant: 393),
                    nameLabel.heightAnchor.constraint(equalToConstant: 57),
                    
                    textField1.topAnchor.constraint(equalTo: avatarka.bottomAnchor, constant: 15),
                    textField1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                    textField1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                    textField1.widthAnchor.constraint(equalToConstant: 393),
                    textField1.heightAnchor.constraint(equalToConstant: 57),
                    
                    penButton1.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 16.5),
                    penButton1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                    penButton1.widthAnchor.constraint(equalToConstant: 24),
                    penButton1.heightAnchor.constraint(equalToConstant: 24),
                    
                    doneButton1.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 16.5),
                    doneButton1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                    doneButton1.widthAnchor.constraint(equalToConstant: 24),
                    doneButton1.heightAnchor.constraint(equalToConstant: 24),
                    
                    surnameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
                    surnameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                    surnameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                    surnameLabel.widthAnchor.constraint(equalToConstant: 393),
                    surnameLabel.heightAnchor.constraint(equalToConstant: 57),
                    
                    textField2.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
                    textField2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                    textField2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                    textField2.widthAnchor.constraint(equalToConstant: 393),
                    textField2.heightAnchor.constraint(equalToConstant: 57),
                    
                    penButton2.topAnchor.constraint(equalTo: surnameLabel.topAnchor, constant: 20),
                    penButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                    penButton2.widthAnchor.constraint(equalToConstant: 24),
                    penButton2.heightAnchor.constraint(equalToConstant: 24),
                    
                    doneButton2.topAnchor.constraint(equalTo: surnameLabel.topAnchor, constant: 20),
                    doneButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                    doneButton2.widthAnchor.constraint(equalToConstant: 24),
                    doneButton2.heightAnchor.constraint(equalToConstant: 24),
                    
                    avatarka.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                    avatarka.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                    avatarka.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                    avatarka.heightAnchor.constraint(equalToConstant: 164),
                    avatarka.widthAnchor.constraint(equalToConstant: 393),
                    
                    icon.centerXAnchor.constraint(equalTo: avatarka.centerXAnchor),
                    icon.centerYAnchor.constraint(equalTo: avatarka.centerYAnchor),
                    icon.widthAnchor.constraint(equalToConstant: 79),
                    icon.heightAnchor.constraint(equalToConstant: 79),
                    
                    cameraButton.topAnchor.constraint(equalTo: avatarka.topAnchor, constant: 98),
                    cameraButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -148),
                    cameraButton.widthAnchor.constraint(equalToConstant: 27),
                    cameraButton.heightAnchor.constraint(equalToConstant: 27),
                    
                    historyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                    historyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    historyButton.widthAnchor.constraint(equalToConstant: 30),
                    historyButton.heightAnchor.constraint(equalToConstant: 30),
                ])
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField == textField1 {
            if let text = textField.text as NSString? {
                let newText = text.replacingCharacters(in: range, with: string)
                
                name = newText // Update the name variable with the new text
                print(name)
            }
        }
        
        
        if textField == textField2 {
            if let text = textField.text as NSString? {
                let newText = text.replacingCharacters(in: range, with: string)
                
                surname = newText // Update the name variable with the new text
                print(surname)
            }
        }
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        if textField == textField1 {
            textField.text=""
        }
        if textField == textField2 {
            textField.text=""
        }
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == textField1 {
            textField.text="Введите имя:"
        }
        if textField == textField2 {
            textField.text="Введите фамилию:"
        }
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
