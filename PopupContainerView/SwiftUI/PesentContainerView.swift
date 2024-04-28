//
//  PesentContainerView.swift
//  PopupContainerView
//
//  Created by Simon McNeil on 2024-04-27.
//

import SwiftUI

struct PresentContainerView<Content: View>: View {
    @State private var contentHeight: CGFloat = .zero

    private let useScrollView: Bool
    private let contentView: Content

    init(useScrollView: Bool = true, @ViewBuilder contentView: () -> Content) {
        self.useScrollView = useScrollView
        self.contentView = contentView()
    }

    var body: some View {
        GeometryReader { geometry in
            if useScrollView {
                ScrollView {
                    contentWithMinHeight(content: contentView, minHeight: geometry.size.height)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                contentWithMinHeight(content: contentView, minHeight: geometry.size.height)
            }
        }
        //.frame(width: 580)
    }

    func contentWithMinHeight(content: Content, minHeight: CGFloat) -> some View {
        content
            .frame(minHeight: minHeight)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}
