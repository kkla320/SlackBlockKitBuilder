//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.12.20.
//

import Foundation

public struct ConversationFilter: Encodable {
    private var include: [ConversationType]?
    private var excludeExternalSharedChannels: Bool?
    private var excludeBotUsers: Bool?
    
    public init(include: [ConversationType]?, excludeExternalSharedChannels: Bool?, excludeBotUsers: Bool?) {
        self.include = include
        self.excludeExternalSharedChannels = excludeExternalSharedChannels
        self.excludeBotUsers = excludeBotUsers
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(include, forKey: .include)
        try container.encodeIfPresent(excludeExternalSharedChannels, forKey: .excludeExternalSharedChannels)
        try container.encodeIfPresent(excludeBotUsers, forKey: .excludeBotUsers)
    }
    
    enum CodingKeys: String, CodingKey {
        case include
        case excludeExternalSharedChannels = "exclude_external_shared_channels"
        case excludeBotUsers = "exclude_bot_users"
    }
}
