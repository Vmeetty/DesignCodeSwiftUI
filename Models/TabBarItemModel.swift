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
}

var tabBarItems = [
    TabBarItemModel(title: "Learn More", imageName: "house"),
    TabBarItemModel(title: "Explore", imageName: "magnifyingglass"),
    TabBarItemModel(title: "Notifications", imageName: "bell"),
    TabBarItemModel(title: "Library", imageName: "rectangle.stack")
]
