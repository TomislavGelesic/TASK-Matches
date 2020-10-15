//
//  ResultViewController.swift
//  TASK-Matches
//
//  Created by Tomislav Gelesic on 15/10/2020.
//

import UIKit

class ResultViewController: UIViewController {
    //MARK: Properties
    let label1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.text = "The largest natural number is:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let onesImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "0")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tensImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "0")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let hundredsImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "0")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let thousandsImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "0")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    //MARK: init
    init(matchesRequired: Int, thousandsImage: UIImage, hundredsImage: UIImage, tensImage: UIImage, onesImage: UIImage) {
        super.init(nibName: nil, bundle: nil)
        
        let label1Text = NSMutableAttributedString(string: "The total number of matches required to display all numbers is: ")
        let attributedString = NSMutableAttributedString(string: "\(matchesRequired)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.brown])
        label1Text.append(attributedString)
        label1.attributedText = label1Text
        
        thousandsImageView.image = thousandsImage
        hundredsImageView.image = hundredsImage
        tensImageView.image = tensImage
        onesImageView.image = onesImage
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "MATCHES"
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(stack)
        stack.addArrangedSubview(thousandsImageView)
        stack.addArrangedSubview(hundredsImageView)
        stack.addArrangedSubview(tensImageView)
        stack.addArrangedSubview(onesImageView)
        
        setConstraints()
        
    }
    
    //MARK: Private Functions
    
    private func setConstraints () {
        label1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        label1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        label1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 30).isActive = true
        label2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        label2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        stack.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
    }
    //MARK: Functions
    
    
    
}
