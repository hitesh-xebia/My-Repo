//
//  MySwiftUIWidgetBundle.swift
//  MySwiftUIWidget
//
//  Created by Hitesh.Chouhan on 28/07/25.
//

import WidgetKit
import SwiftUI

@main
struct MySwiftUIWidgetBundle: WidgetBundle {
    var body: some Widget {
        MySwiftUIWidget()
        MySwiftUIWidgetControl()
        MySwiftUIWidgetLiveActivity()
    }
}
