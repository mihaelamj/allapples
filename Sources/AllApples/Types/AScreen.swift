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

