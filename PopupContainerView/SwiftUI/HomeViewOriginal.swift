//
//  ContentViewOrigial.swift
//  PopupContainerView
//
//  Created by Simon McNeil on 2024-04-28.
//

import Foundation
import SwiftUI

struct HomeViewOriginal: View {
    @State private var showDatePicker: Bool = false
    @State private var contentHeight: CGFloat = .zero

    @ObservedObject private var viewModel: MainContentViewModel = MainContentViewModel()

    init(viewModel: MainContentViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(spacing: 20) {
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

                    Button {
                        showDatePicker.toggle()
                    } label: {
                        Text("Show Date")
                    }
                }
                .padding(40)
                .background(
                    Color.clear
                        .readSize { size in
                            contentHeight = size.height
                        }
                )
                .frame(maxWidth: .infinity)
                .padding(40)
                .background(.white)
                .cornerRadius(10)
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
            }
            .overlay(
                Rectangle()
                    .fill(viewModel.isPopupVisible ? Color.black.opacity(0.3): .clear)
                    .frame(width: geometry.size.width, height: contentHeight, alignment: .center)
                    .cornerRadius(10)
            )
        }
    }
}
