//
//  Styles.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/4/23.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var cornerRadius: CGFloat
    func body(content: Content) -> some View {
        content.overlay {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.6 : 0.3),
                            .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                        ], startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .blendMode(.overlay)
        }
    }
}
