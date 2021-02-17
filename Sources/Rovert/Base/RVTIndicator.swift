//
//  RVTIndicator.swift
//  
//
//  Created by Salihcan Kahya on 17.02.2021.
//

import UIKit

open class RVTIndicator: UIView {
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    func loadView() {
        frame.size = .init(width: 30, height: 30)
    }
}
