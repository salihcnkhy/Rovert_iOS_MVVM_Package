//
//  ErrorType.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 15.02.2021.
//

public enum RVTErrorType: RVTErrorTypeProtocol {
    
    
    case invalidURL (String)
    
    public var message: String {
        switch self {
        case .invalidURL(let url):
            return "\(url) is invalid"
        }
    }
}

extension RVTErrorType {
    
    enum CodingKeys: CodingKey {
        case invalidURL
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let key = container.allKeys.first
        switch key {
        case .invalidURL:
            let message = try container.decode(String.self, forKey: .invalidURL)
            self = .invalidURL(message)
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: container.codingPath,
                    debugDescription: "Unabled to decode enum."
                )
            )
        }
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .invalidURL(let message):
            try container.encode(message, forKey: .invalidURL)
        }
    }
}
