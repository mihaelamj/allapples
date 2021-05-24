//
//  File.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 24.05.2021..
//


#if os(OSX)
import Cocoa

public extension NSView {
  func makeLikeUIView() {
    wantsLayer = true
    layerContentsRedrawPolicy = .onSetNeedsDisplay
  }
}
#endif


