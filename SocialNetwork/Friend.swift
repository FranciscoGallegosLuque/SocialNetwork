//
//  Friend.swift
//  SocialNetwork
//
//  Created by Francisco Manuel Gallegos Luque on 20/02/2025.
//

import Foundation
import SwiftData

@Model
class Friend: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    var id: UUID
    var name: String
    
    required init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<Friend.CodingKeys> = try decoder.container(keyedBy: Friend.CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: Friend.CodingKeys.id)
        self.name = try container.decode(String.self, forKey: Friend.CodingKeys.name)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
}
