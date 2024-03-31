//
//  userModel.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 31/03/2024.
//

import Foundation
struct GitHubUser: Codable {
    var login: String
    var avatarUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
func fetchGitHubUsers(completion: @escaping ([GitHubUser]?) -> Void) {
    guard let url = URL(string: "https://api.github.com/users") else {
        completion(nil)
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            completion(nil)
            return
        }
        
        do {
            let users = try JSONDecoder().decode([GitHubUser].self, from: data)
            completion(users)
        } catch {
            print("Error decoding JSON: \(error)")
            completion(nil)
        }
    }.resume()
}
