//
//  ApiRow.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 31/03/2024.
//

import SwiftUI

struct ApiRow: View {
    @State var user: GitHubUser
    @State var isShowDetail = false
    
    var body: some View {
        NavigationLink(destination: UserDetailView(user: user), isActive: $isShowDetail) {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 100)
                .foregroundColor(.white)
                .overlay{
                    HStack{
                        Circle()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.blue)
                            .overlay{
                                AsyncImage(url: URL(string: "\(user.avatarUrl)"))
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                            }
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Name") // Thay đổi thành tên trường dữ liệu bạn muốn hiển thị
                            Text(user.login)
                                .font(.system(size: 30))
                                .bold()
                                .padding(.leading, 20)
                        }
                        Spacer()
                    }
                }
        }
        .onTapGesture {
            isShowDetail = true // Khi người dùng nhấn vào, chuyển `isShowDetail` thành true để mở màn hình chi tiết
        }
    }
}



#Preview {
    ApiRow(user: GitHubUser(login: "ahi", avatarUrl: URL(string: "https://hws.dev/paul.jpg")!))
}
