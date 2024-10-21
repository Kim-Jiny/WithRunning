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
    
    func setUpSpeedView(_ unit: IntervalUnit) {
        mainStackView.axis = .vertical
        self.addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { 
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        self.mainStackView.addArrangedSubview(spacingView)
        self.mainStackView.addArrangedSubview(unitView)
        unitView.snp.makeConstraints {
            $0.height.equalTo(unit.speed * 4)
        }
        unitView.backgroundColor = getSpeedColor(unit.speed)
    }
    
    private func getSpeedColor(_ speed: Int) -> UIColor {
        switch speed {
        case 1,2:
            return UIColor.speedMain4
        case 3,4:
            return UIColor.speedMain3
        case 5,6:
            return UIColor.speedMain2
        case 7,8:
            return UIColor.speedMain1
        case 9,10:
            return UIColor.speedMain0
        default:
            return UIColor.white
        }
    }
}
