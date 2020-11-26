//
//  ClaimsDetailSectionGen.swift
//  ClaimClientProgUI
//
//  Created by Justin Poblete on 11/25/20.
//  Copyright © 2020 Justin Poblete. All rights reserved.
//

import UIKit

class ClaimDetailSectionGen {
    
    var vals = [UITextField]()
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
        
        let stackView1 = UIStackView()
        stackView1.distribution = .fill
        
        let enterClaim = UILabel()
        enterClaim.text = "Please Enter Claim Information"
        enterClaim.textAlignment = .center
        enterClaim.font = UIFont(name: "Helvetica-Bold", size: 20)
        stackView1.addArrangedSubview(enterClaim)
        stackView.addArrangedSubview(stackView1)
        
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        let sv1Cnt1 = stackView1.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor)
        let sv1Cnt2 = stackView1.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor)
        let sv1Cnt3 = stackView1.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor)
        sv1Cnt1.isActive = true
        sv1Cnt2.isActive = true
        sv1Cnt3.isActive = true
        
        var vGenerator = FieldValueViewGen(txt: "Claim Title:")
        let sView1 = vGenerator.generate()
        stackView.addArrangedSubview(sView1)
        vGenerator = FieldValueViewGen(txt: "Date:")
        let sView2 = vGenerator.generate()
        stackView.addArrangedSubview(sView2)
        
        for sv in stackView.arrangedSubviews {
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews { 
                if ve is UITextField {
                    vals.append(ve as! UITextField)
                }
            }
        }
        
        for i in 0...vals.count-1 {
            vals[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = vals[i].leadingAnchor.constraint(equalTo: vals[0].leadingAnchor)
            constr.isActive = true
        }
    
        return stackView
    }
}
