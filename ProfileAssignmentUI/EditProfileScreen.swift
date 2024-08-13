//
//  EditProfileScreen.swift
//  ProfileAssignmentUI
//
//  Created by Muhammad Bilal Shakoor on 8/12/24.
//

import SwiftUI

struct EditProfileScreen: View {
    @Binding var name: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var description: String
    @State private var showAlert = false
    
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
                    
                    Text("Edit Screen")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(UIColor(named: "darkBlue") ?? .black))
                    
                    Spacer(minLength: 20)
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 20)
                        
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 20)
                        
                        TextField("Phone", text: $phone)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 20)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white)
                                .stroke(Color.gray, lineWidth: 1)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("User Details")
                                    .font(.headline)
                                
                                TextEditor(text: $description)
                                    .frame(height: 150)
                            }
                            .padding(10)
                        }
                        .padding(.horizontal, 20)
                    }
                    Spacer(minLength: 50)
                    Button(action: {
                        saveDetails()
                        showAlert = true
                    }) {
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 41)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor(named: "darkBlue") ?? .blue))
                            )
                            .padding(.horizontal, 20)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Success"),
                            message: Text("Your details have been updated."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
            })
            .background(Color("F3F3F3"))
        }
    }
    
    private func saveDetails() {
        let defaults = UserDefaults.standard
        defaults.set(name, forKey: "name")
        defaults.set(email, forKey: "email")
        defaults.set(phone, forKey: "phone")
        defaults.set(description, forKey: "description")
    }
}



#Preview {
    EditProfileScreen(name: .constant(""), email: .constant(""), phone: .constant(""), description: .constant(""))
}
