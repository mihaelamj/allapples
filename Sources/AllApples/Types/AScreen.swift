//
//  AScreen.swift
//  AllApples
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//  Original source: https://github.com/soffes/X

#if os(iOS) || os(tvOS)
import UIKit.UIScreen
public typealias AScreen = UIScreen
#elseif os(macOS)
import AppKit.NSScreen
public typealias AScreen = NSScreen

extension NSScreen {
  public var scale: CGFloat {
    return backingScaleFactor
  }
}
#endif

public extension AScreen {
  static func supposedSize() -> CGSize {
    #if os(iOS) || os(tvOS)
    return AScreen.main.bounds.size
    #endif
    
    #if os(OSX)
    return AScreen.main?.visibleFrame.size ?? CGSize(width: 500.0, height: 500.0)
    #endif
  }
}

