//
//  SignInView.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/26/23.
//

import SwiftUI

struct SignInView: View {
    enum Field {
        case email
        case password
    }
    
    @State var email = ""
    @State var password = ""
    @FocusState var focusedField: Field?
    @State var yCircle: CGFloat = 120
    @State var emailY: CGFloat = 0
    @State var passwordY: CGFloat = 0
    @State var circleColor: Color = .blue
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sign in")
                .font(.largeTitle).bold()
            Text("Access 120+ hours of courses, tutorials and livestreams")
                .font(.headline)
            TextField("Email", text: $email)
                .inputStyle(icon: "mail")
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .focused($focusedField, equals: .email)
                .shadow(color: focusedField == .email ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                .overlay(geometry)
                .onPreferenceChange(CirclePreferenceKey.self) { value in
                    emailY = value
                    yCircle = value
                }
            SecureField("Password", text: $password)
                .inputStyle(icon: "lock")
                .textContentType(.password)
                .focused($focusedField, equals: .password)
                .shadow(color: focusedField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                .overlay(geometry)
                .onPreferenceChange(CirclePreferenceKey.self) { value in
                    passwordY = value
                }
            Button {
                
            } label: {
                Text("Create account")
                    .frame(maxWidth: .infinity)
            }
            .font(.headline)
            .blendMode(.overlay)
            .buttonStyle(.angular)
            .tint(.accentColor)
            .controlSize(.large)
            
            Group {
                Divider()
                
                HStack {
                    Text("No account yet?")
                    Button {
                        model.selectedModalView = .signUp
                    } label: {
                        Text("**Sign up**")
                    }
                }
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            .tint(.secondary)
            
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(
            Circle().fill(circleColor)
                .frame(width: 68, height: 68)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(y: yCircle)
        )
        .coordinateSpace(name: "container")
        .strokeStyle(cornerRadius: 30)
        .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 20)
        .padding(20)
        .background(
            Image("Blob 1")
                .offset(x: 200, y: -50)
        )
        .onChange(of: focusedField) { value in
            withAnimation {
                yCircle = focusedField == .email ? emailY : passwordY
                circleColor = focusedField == .email ? .blue : .red
            }
        }
    }
    
    var geometry: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("container")).minY)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(Model())
    }
}
