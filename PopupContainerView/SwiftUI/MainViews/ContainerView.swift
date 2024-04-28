//
//  HomeView.swift
//  PopupContainerView
//
//  Created by Simon McNeil on 2024-04-27.
//

import Foundation
import SwiftUI

enum PopupState: Equatable {
    case none
    case warning
}

class MainContentViewModel: ObservableObject {
    @Published var isPopupVisible: Bool = false
    @Published var popupState: PopupState = .none
}

struct ContainerView: View {
    @StateObject private var viewModel = MainContentViewModel()

    var body: some View {
        ZStack {
            HomeViewOriginal(viewModel: viewModel)
                .showOverlay(isPopupVisible: $viewModel.isPopupVisible)

            PopUpView(state: $viewModel.popupState)
        }
    }
}
