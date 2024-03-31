//
//  UserDetailView.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 31/03/2024.
//

import SwiftUI

struct UserDetailView: View {
    @State var user: GitHubUser
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "\(user.avatarUrl)"), scale: 2)
            { image in image.resizable() }placeholder: { Color.red }
                .frame(width: .infinity, height: 400) .clipShape(RoundedRectangle(cornerRadius: 25))
            Spacer()
            Text("Name :\(user.login)")
                .font(.system(size: 40))
                .bold()
            Spacer()
        }
    }
}

#Preview {
    UserDetailView(user: GitHubUser(login: "ahi", avatarUrl: URL(string: "https://hws.dev/paul.jpg")!))
}
