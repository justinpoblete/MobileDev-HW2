//
//  FieldValueViewGen.swift
//  ClaimClientProgUI
//
//  Created by Justin Poblete on 11/25/20.
//  Copyright © 2020 Justin Poblete. All rights reserved.
//

import UIKit

class FieldValueViewGen {
    var name : String!
    
    init(txt : String){
        name = txt
    }
    
    func generate() -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 20
        
        let label = UILabel()
        label.text = name
        stackView.addArrangedSubview(label)
        let val = UITextField()
        
        val.borderStyle = .line
        val.placeholder = " "
        val.sizeToFit()
        stackView.addArrangedSubview(val)
        
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        val.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        val.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        return stackView
    }
}
