//
//  ViewController.swift
//  TASK-Matches
//
//  Created by Tomislav Gelesic on 15/10/2020.
//

import UIKit

class InputViewController: UIViewController {
    
    //MARK: Properties
    let inputTextField1: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Highest result number"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let inputTextField2: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Number of matches"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.brown
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "MATCHES"
        
        view.addSubview(inputTextField1)
        view.addSubview(inputTextField2)
        view.addSubview(calculateButton)
        
        inputTextField1.setBottomBorder()
        inputTextField2.setBottomBorder()
        calculateButton.layer.cornerRadius = 20
        calculateButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        setConstraints()
        
        
    }
    //MARK: Functions
    @objc func calculateButtonTapped () {
        
        let highestNumber = Int(inputTextField1.text ?? "") ?? 0
        var availableMatches = Int(inputTextField2.text ?? "") ?? 0
        
        
        let resultViewController = ResultViewController(matchesRequired: getNumberOfMatches(number: highestNumber),
                                                        thousandsImage: UIImage(named: "1")!, hundredsImage: UIImage(named: "1")!,
                                                        tensImage: UIImage(named: "1")!, onesImage: UIImage(named: "1")!)
        
        let nav = UINavigationController(rootViewController: resultViewController)
        nav.modalPresentationStyle = .fullScreen
        
        self.present(nav, animated: true, completion: nil)
        
        
    }
    
    func getNumberOfMatches (number: Int) -> Int {
        var numberOfMatches = 0
        return numberOfMatches
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputTextField1.resignFirstResponder()
        inputTextField2.resignFirstResponder()
    }
    
    func setConstraints(){
        
        inputTextField1.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        inputTextField1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        inputTextField1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        inputTextField1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        inputTextField1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        inputTextField2.topAnchor.constraint(equalTo: inputTextField1.bottomAnchor,constant: 20).isActive = true
        inputTextField2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        inputTextField2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        inputTextField2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        inputTextField2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        calculateButton.topAnchor.constraint(equalTo: inputTextField2.bottomAnchor, constant: 40).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        calculateButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}


//MARK: Extensions
extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension UIButton{
    func roundedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.bottomLeft , .topRight],
                                     cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
