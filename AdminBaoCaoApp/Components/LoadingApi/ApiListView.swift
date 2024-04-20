//
//  ApiListView.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 31/03/2024.
//

import SwiftUI
//import URLImage

struct ApiListView: View {
    @State private var users: [GitHubUser] = []
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List(filteredUsers, id: \.login) { user in
                ApiRow(user: user)
            }
            .searchable(text: $searchText)
            .onAppear {
                fetchGitHubUsers { fetchedUsers in
                    if let fetchedUsers = fetchedUsers {
                        DispatchQueue.main.async {
                            self.users = fetchedUsers
                        }
                    }
                }
            }
            .navigationTitle("GitHub Users")
        }
    }

    var filteredUsers: [GitHubUser] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter { $0.login.localizedCaseInsensitiveContains(searchText) }
        }
    }
//    func loading1(uRL:String) {
//            let url = URL(string: uRL)
//            let data = try? Data(contentsOf: url!)
//            if let imageData = data {
//                let image = UIImage(data: imageData)
//                imageView1.image = image
//            }
//        }
}

struct ApiListView_Previews: PreviewProvider {
    static var previews: some View {
        ApiListView()
    }
}
