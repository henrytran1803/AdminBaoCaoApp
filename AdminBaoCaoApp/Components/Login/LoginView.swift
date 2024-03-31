//
//  LoginView.swift
//  AdminBaoCaoApp
//
//  Created by Tran Viet Anh on 31/03/2024.
//

import SwiftUI


struct LoginView: View {
    
    @State private var username = UserDefaults.standard.string(forKey: "username") ?? ""
    @State private var password = UserDefaults.standard.string(forKey: "password") ?? ""
    @State private var isSavePass = false
    @State private var isLogin = false
    @State private var isChart = false
    @State private var loginCount = 0
    @State private var loginSuccess = 0
    @State private var dataLogin: [dataLogin] = []
    @State private var showAlert = false
    
    init() {
        _dataLogin = State(initialValue: [AdminBaoCaoApp.dataLogin(id: UUID(),name: "Số lần đăng nhập", value: 0), AdminBaoCaoApp.dataLogin(id: UUID(),name: "Số lần đăng nhập thành công", value: 0)])
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Đăng nhập")
                .font(.system(size: 40))
                .bold()
                .frame(maxWidth: .infinity, alignment: .center)
            TextField("User name", text: $username )
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [.red, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(25)
                .padding(3)
            SecureField("Password", text: $password )
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [.red, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(25)
                .padding(3)

            HStack{
                Button(action: { isSavePass.toggle() }, label: {
                    Image(systemName: isSavePass ? "checkmark.square.fill" : "checkmark.square")
                })
                Text("Ghi nhớ mật khẩu")
            }
            HStack{
                Spacer()
                Button(action: { isChart.toggle() }, label: {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 150, height: 50)
                        .overlay{
                            Text("Biểu đồ")
                                .foregroundStyle(.black)
                        }
                })
                Button(action: {
                    if username.isEmpty || password.isEmpty {
                        showAlert = true
                    }
                    else{
                        if isSavePass {
                            UserDefaults.standard.set(password, forKey: "password")
                            UserDefaults.standard.set(username, forKey: "username")
                        } else {
                            UserDefaults.standard.removeObject(forKey: "password")
                            UserDefaults.standard.removeObject(forKey: "username")
                        }
                        if username == password {
                            loginCount += 1
                            loginSuccess += 1
                        } else {
                            loginCount += 1
                        }
                        
                        dataLogin[0].value = loginCount
                        dataLogin[1].value = loginSuccess
                    }
                }, label: {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 150, height: 50)
                        .overlay{
                            Text("Đăng nhập")
                                .foregroundStyle(.black)
                        }
                })
                Spacer()
                
                
            }
            if !isChart {
                Spacer()
            } else {
                PieChartLogin(data: $dataLogin)
            }
            
        }.padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Lỗi"),
                    message: Text("Tài khoản hoặc mật khẩu không thể bỏ trống ")
                )
            }
    }
}

#Preview {
    LoginView()
}
