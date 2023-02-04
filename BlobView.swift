//
//  BlobView.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/4/23.
//

import SwiftUI

struct BlobView: View {
    var body: some View {
        Canvas { context, size in
            context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height)), with: .linearGradient(Gradient(colors: [.blue, .pink]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 400, y: 400)))
        }
        .frame(width: 386, height: 478)
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.95475*width, y: 0.44317*height))
        path.addCurve(to: CGPoint(x: 0.81565*width, y: height), control1: CGPoint(x: 0.95475*width, y: 0.69004*height), control2: CGPoint(x: 1.12119*width, y: height))
        path.addCurve(to: CGPoint(x: 0, y: 0.38314*height), control1: CGPoint(x: 0.5101*width, y: height), control2: CGPoint(x: 0, y: 0.63001*height))
        path.addCurve(to: CGPoint(x: 0.70183*width, y: 0), control1: CGPoint(x: 0, y: 0.13627*height), control2: CGPoint(x: 0.39628*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.95475*width, y: 0.44317*height), control1: CGPoint(x: 1.00738*width, y: 0), control2: CGPoint(x: 0.95475*width, y: 0.1963*height))
        path.closeSubpath()
        return path
    }
}

struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        BlobView()
    }
}

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.95475*width, y: 0.44317*height))
        path.addCurve(to: CGPoint(x: 0.81565*width, y: height), control1: CGPoint(x: 0.95475*width, y: 0.69004*height), control2: CGPoint(x: 1.12119*width, y: height))
        path.addCurve(to: CGPoint(x: 0, y: 0.38314*height), control1: CGPoint(x: 0.5101*width, y: height), control2: CGPoint(x: 0, y: 0.63001*height))
        path.addCurve(to: CGPoint(x: 0.70183*width, y: 0), control1: CGPoint(x: 0, y: 0.13627*height), control2: CGPoint(x: 0.39628*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.95475*width, y: 0.44317*height), control1: CGPoint(x: 1.00738*width, y: 0), control2: CGPoint(x: 0.95475*width, y: 0.1963*height))
        path.closeSubpath()
        return path
    }
}
