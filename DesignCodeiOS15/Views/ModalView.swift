//
//  ModalView.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/26/23.
//

import SwiftUI

struct ModalView: View {
    @AppStorage("showModal") var showModal = true
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            Color.clear.background(.regularMaterial)
                .ignoresSafeArea()
            
            switch model.selectedModalView {
            case .signUp:
                SignUpView()
            case .signIn:
                SignInView()
            }
            
            Button {
                withAnimation {
                    showModal = false
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(Model())
    }
}
