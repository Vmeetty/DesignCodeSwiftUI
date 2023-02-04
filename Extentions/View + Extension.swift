//
//  View + Extension.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/4/23.
//

import SwiftUI

extension View {
    func strokeStyle(cornerRadius: CGFloat = 30.0) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}

