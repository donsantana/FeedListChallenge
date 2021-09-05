//
//  View.swift
//  TMobileChallenge
//
//  Created by Donelkys Santana on 9/5/21.
//

import SwiftUI

extension View {
  
  func hideListRowSeparator() -> some View {
    return customListRowSeparator(insets: .init(), insetsColor: .clear)
  }
  
  func customListRowSeparator(
    insets: EdgeInsets,
    insetsColor: Color) -> some View {
    modifier(HideRowSeparatorModifier(insets: insets,
                                      background: insetsColor
    )) .onAppear {
      UITableView.appearance().separatorStyle = .none
      UITableView.appearance().separatorColor = .clear
    }
  }
  
}

private struct HideRowSeparatorModifier: ViewModifier {
  
  var insets: EdgeInsets
  var background: Color
  
  func body(content: Content) -> some View {
    content
      .padding(insets)
      .frame(
        minWidth: 0,
        maxWidth: .infinity,
        maxHeight: .infinity,
        alignment: .leading
      )
      .listRowInsets(EdgeInsets())
      .background(background)
  }
}
