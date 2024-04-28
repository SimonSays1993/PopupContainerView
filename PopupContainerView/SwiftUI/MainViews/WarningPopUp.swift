//
//  WarningPopUp.swift
//  PopupContainerView
//
//  Created by Simon McNeil on 2024-04-27.
//

import Foundation
import SwiftUI

struct WarningPopUpView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .font(.largeTitle)
                .foregroundStyle(.yellow)

            Text("This is the pop up View")
                .foregroundStyle(.white)
        }
        .background(.gray)
        .frame(width: 400, height: 330)
        .cornerRadius(10)
    }
}
