//
//  View+Ext.swift
//  PopupContainerView
//
//  Created by Simon McNeil on 2024-04-27.
//

import Foundation
import SwiftUI

extension View {
    func showOverlay(isPopupVisible: Binding<Bool>) -> some View {
        modifier(OverlayModifier(isPopupVisible: isPopupVisible))
    }

    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometry in
                Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)    }
}
