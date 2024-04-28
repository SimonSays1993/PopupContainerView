//
//  PopUpView.swift
//  PopupContainerView
//
//  Created by Simon McNeil on 2024-04-27.
//

import Foundation
import SwiftUI

struct PopUpView: View {
    @Binding var state: PopupState

    var body: some View {
        switch state {
        case .none:
            EmptyView()
        case .warning:
            popupContainer {
                WarningPopUpView()
            }
        }
    }

    @ViewBuilder
    private func popupContainer(@ViewBuilder content: @escaping () -> some View) -> some View {
        VStack {
            Spacer()
            content()
            Spacer()
        }
    }
}
