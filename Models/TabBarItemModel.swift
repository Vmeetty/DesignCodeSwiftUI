//
//  TabBarItemModel.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/4/23.
//

import SwiftUI

struct TabBarItemModel: Identifiable {
    var id = UUID()
    var title: String
    var imageName: String
    var tab: Tab
}

var tabBarItems = [
    TabBarItemModel(title: "Learn More", imageName: "house", tab: .home),
    TabBarItemModel(title: "Explore", imageName: "magnifyingglass", tab: .explore),
    TabBarItemModel(title: "Notifications", imageName: "bell", tab: .notifications),
    TabBarItemModel(title: "Library", imageName: "rectangle.stack", tab: .library)
]

enum Tab: String {
    case home, explore, notifications, library
}
