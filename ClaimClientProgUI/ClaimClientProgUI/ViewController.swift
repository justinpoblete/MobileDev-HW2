//
//  ViewController.swift
//  ClaimClientProgUI
//
//  Created by Justin Poblete on 11/25/20.
//  Copyright © 2020 Justin Poblete. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button = UIButton()
    let statusMessage = UILabel()
    var vals = [UITextField]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let vGen = ClaimDetailSectionGen()
        let mainView = vGen.generate()
        view.addSubview(mainView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        let tCont = mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        let lCont = mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5)
        let trCont = mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5)
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
               
        let buttonSV = UIStackView()
        buttonSV.spacing = 20
        button.setTitle(" Add ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(addTapped(_:)), for: .touchUpInside)
        buttonSV.addArrangedSubview(button)
        view.addSubview(buttonSV)
        
        buttonSV.translatesAutoresizingMaskIntoConstraints = false
        let bCnt1 = buttonSV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5)
        let bCnt2 = buttonSV.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 5)
        bCnt1.isActive = true
        bCnt2.isActive = true
        
        let cViews = mainView.arrangedSubviews
        for sv in cViews {
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews {
                if ve is UITextField {
                    vals.append(ve as! UITextField)
                }
            }
        }
        
        let statusSV = UIStackView()
        statusSV.axis = .horizontal
        statusSV.spacing = 20
        let status = UILabel()
        status.text = "Status:"
        statusSV.addArrangedSubview(status)
        statusMessage.text = "<Status Message>"
        statusSV.addArrangedSubview(statusMessage)
        view.addSubview(statusSV)
        
        statusSV.translatesAutoresizingMaskIntoConstraints = false
        let sCnt1 = statusSV.topAnchor.constraint(equalTo: buttonSV.bottomAnchor, constant: 5)
        let sCnt2 = statusSV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let sCnt3 = statusSV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        sCnt1.isActive = true
        sCnt2.isActive = true
        sCnt3.isActive = true
    }
    @objc func addTapped(_ sender : UIButton){
        print("ADD was tapped")
        let claimTitle = vals[0].text as String?
        let claimDate = vals[1].text as String?
        let claim = ClaimService()
        
        if claimTitle!.isEmpty && claimDate!.isEmpty {
            self.statusMessage.text = "Nothing Entered"
        }
        else if claimTitle!.isEmpty {
            self.statusMessage.text = "Enter Claim Title"
        }
        else if claimDate!.isEmpty {
            self.statusMessage.text = "Enter Date"
        }
        else {
            let cObj = Claim(title: claimTitle!, date: claimDate!)
            claim.addClaim(cObj: cObj, completion: { value in
                if value{
                    self.statusMessage.text = "Claim \(claimTitle!) was successfully created"
                    self.vals[0].text = ""
                    self.vals[1].text = ""
                }
                else {
                    self.statusMessage.text = "Claim \(claimTitle!) failed to be created"
                }
                
            })
        }
    }
}
