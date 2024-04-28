//
//  OverlayModifier.swift
//  PopupContainerView
//
//  Created by Simon McNeil on 2024-04-27.
//

import Foundation
import SwiftUI

struct OverlayModifier: ViewModifier {
    @State var contentHeight: CGFloat = .zero
    @Binding var isPopupVisible: Bool

    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .background {
                Color.clear
                    .readSize { size in
                        contentHeight = size.height
                    }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isPopupVisible ? Color.black.opacity(0.3) : .clear)
            )
    }
}
