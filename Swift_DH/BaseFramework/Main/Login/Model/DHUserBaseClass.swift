//
//  DHUserBaseClass.swift
//
//  Created by mac on 2020/3/10
//  Copyright (c) . All rights reserved.
//

import Foundation

struct DHUserBaseClass: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case email
    case sipCallerName = "sip-caller-name"
    case username
    case sipPassword = "sip-password"
    case sipName = "sip-name"
    case authToken
  }

  var id: Int?
  var email: String?
  var sipCallerName: String?
  var username: String?
  var sipPassword: String?
  var sipName: String?
  var authToken: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    email = try container.decodeIfPresent(String.self, forKey: .email)
    sipCallerName = try container.decodeIfPresent(String.self, forKey: .sipCallerName)
    username = try container.decodeIfPresent(String.self, forKey: .username)
    sipPassword = try container.decodeIfPresent(String.self, forKey: .sipPassword)
    sipName = try container.decodeIfPresent(String.self, forKey: .sipName)
    authToken = try container.decodeIfPresent(String.self, forKey: .authToken)
  }

}
