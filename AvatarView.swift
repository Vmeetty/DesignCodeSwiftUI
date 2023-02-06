//
//  AvatarView.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/6/23.
//

import SwiftUI

struct AvatarView: View {
    var body: some View {
        Image("Avatar Default")
            .resizable()
            .frame(width: 26, height: 26)
            .cornerRadius(10)
            .padding(8)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            .strokeStyle(cornerRadius: 18)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
