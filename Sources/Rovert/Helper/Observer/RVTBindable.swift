//
//  RVTBindable.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 7.02.2021.
//

import Foundation

public struct RVTBindable<T> {
    
    public typealias Binder = ((T?) -> ())
    
    public var value : T? {
        didSet {
            notifyAll(with: value)
        }
    }
    
    public init(with value : T? = nil) {
        self.value = value
    }

    private var bindeds : [Binder] = []
    
    public mutating func bind(binder : @escaping Binder) {
        bindeds.append(binder)
    }
    
    private func notifyAll(with value : T?) {
        for binded in bindeds {
            binded(value)
        }
    }
}
