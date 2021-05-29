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

public extension NSView {
  func debugLayerInfo() {
    debugPrint("wantsLayer = \(wantsLayer)")
    debugPrint("wantsUpdateLayer = \(wantsUpdateLayer)")
    debugPrint("isFlipped = \(isFlipped)")
    debugPrint("layerContentsRedrawPolicy = \(layerContentsRedrawPolicy.toString())")
    debugPrint("\(layerContentsRedrawPolicy.explanation())")
  }
}
#endif

#if os(iOS) || os(tvOS)
import UIKit
public extension UIView {
  func debugLayerInfo() {
    debugPrint("wantsLayer = True")
    debugPrint("isFlipped = True")
  }
}
#endif
