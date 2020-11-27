//
//  AColor.swift
//  AllApples
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//  Original source: https://github.com/soffes/X

#if os(macOS)
import AppKit.NSColor
public typealias AColor = NSColor

extension NSColor {
  public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
    self.init(srgbRed: red, green: green, blue: blue, alpha: alpha)
  }
}
#else
import UIKit.UIColor
public typealias AColor = UIColor
#endif
