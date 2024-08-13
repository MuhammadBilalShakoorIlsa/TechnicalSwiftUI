//
//  ContentView.swift
//  ProfileAssignmentUI
//
//  Created by Muhammad Bilal Shakoor on 8/11/24.
//

import SwiftUI

struct ProfileScreen: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical,showsIndicators: false, content: {
                VStack() {
                    Spacer(minLength: 20)
                    
                    GeometryReader { value in
                        Image(uiImage: UIImage.profile)
                            .resizable()
                            .padding(.horizontal, value.size.width > 768 ? 0 : 20)
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    Spacer(minLength: 20)
                    
                    Text("Profile Screen")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(UIColor(named: "darkBlue") ?? .black))
                    
                    Spacer(minLength: 20)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color.white)
                            .stroke(Color.gray, lineWidth: 1.0)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("Name:")
                                
                                Text("\(name)")
                                    .bold()
                                    .padding(.leading, 50)
                            }
                            HStack {
                                Text("Email:")
                                Text("\(email)")
                                    .bold()
                                    .padding(.leading, 50)
                                    .tint(Color.black)
                            }
                            HStack {
                                Text("Phone:")
                                Text("\(phone)")
                                    .bold()
                                    .padding(.leading, 50)
                            }
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    }
                    .frame(height: 150)
                    .padding(.horizontal, 20)
                    
                    Spacer(minLength: 20)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color.white)
                            .stroke(Color.gray, lineWidth: 1.0)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("User Details")
                                .font(.headline)
                            Text(description)
                                .font(.callout)
                                .foregroundColor(.gray)
                            
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
                        .padding(.horizontal, 20)
                        .padding(.top, 5)
                    }
                    .frame(height: 150)
                    .padding(.horizontal, 20)
                    
                    Spacer(minLength: 20)
                    NavigationLink(destination: EditProfileScreen(name: $name, email: $email, phone: $phone, description: $description)) {
                        Text("Edit Profile")
                            .foregroundColor(Color(uiColor: .white))
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 41)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(uiColor: .darkBlue))
                            )
                            .padding(.horizontal, 20)
                        
                    }
                    .onAppear(perform: {
                        loadDetails()
                    })
                    
                }
            })
            .background(Color("F3F3F3"))
        }
    }
    
    private func loadDetails() {
        let defaults = UserDefaults.standard
        name = defaults.string(forKey: "name") ?? "Your Name"
        email = defaults.string(forKey: "email") ?? "youremail@gmail.com"
        phone = defaults.string(forKey: "phone") ?? "03419091122"
        description = defaults.string(forKey: "description") ?? "Enter your description"
    }
}

#Preview {
    ProfileScreen()
}
