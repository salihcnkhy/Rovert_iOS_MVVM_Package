//
//  RVTDataSourceDictionary.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 12.02.2021.
//

public struct RVTDataSourceDictionary<T> {
    private var storage = [RVTDataSourceTypeWrapper: T]()
    
    public subscript<Value>(key: Value.Type) -> Value? where Value: RVTDataSourceProtocol {
        get {
            return storage[RVTDataSourceTypeWrapper(model: key)] as? Value
        }
        set {
            storage[RVTDataSourceTypeWrapper(model: key)] = newValue as? T
        }
    }
}
