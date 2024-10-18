//
//  IntervalSpeedView.swift
//  WithRunning
//
//  Created by 김미진 on 10/18/24.
//

import Foundation
import UIKit

class IntervalSpeedView: UIView {
    
    let mainStackView = UIStackView()
    let spacingView = UIView()
    let unitView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSpeedView(_ unit: IntervalUnit) {
        mainStackView.axis = .horizontal
        self.addSubview(mainStackView)
        
        self.mainStackView.addArrangedSubview(spacingView)
        self.mainStackView.addArrangedSubview(unitView)
        unitView.snp.makeConstraints {
            $0.width.equalTo(unit.speed * 2)
        }
    }
}
