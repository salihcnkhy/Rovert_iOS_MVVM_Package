//
//  RVTDataSourceTypeWrapper.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 12.02.2021.
//

public struct RVTDataSourceTypeWrapper: Equatable, Hashable {

    public let model: RVTDataSourceHashableProtocol.Type
   
   public func hash(into hasher: inout Hasher) {
    }
    
   public static func == (lhs: RVTDataSourceTypeWrapper, rhs: RVTDataSourceTypeWrapper) -> Bool {
    return lhs.model == rhs.model
    }
}
