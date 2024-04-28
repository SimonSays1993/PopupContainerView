//
//  HomeView.swift
//  PopupContainerView
//
//  Created by Simon McNeil on 2024-04-27.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var showDatePicker: Bool = false

    @ObservedObject private var viewModel: MainContentViewModel

    init(viewModel: MainContentViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")

            if showDatePicker {
                DatePicker(
                    "",
                    selection: .constant(Date()),
                    displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .padding(.top, 8)
            }

            Button {
                viewModel.popupState = .warning
            } label: {
                Text("Show Warning Pop Up")
            }

            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")

            Button {
                showDatePicker.toggle()
            } label: {
                Text("Show Date")
            }
        }
        .frame(maxWidth: .infinity)
        .padding(40)
    }
}
