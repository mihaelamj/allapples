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

public extension AColor {
  static func randomColor() -> AColor {
    let colors = systemColors()
    return colors.randomElement() ?? AColor.systemBlue
  }
  
  static func systemColors() -> [AColor] {
    #if os(macOS)
    return [
      AColor.systemRed,
      AColor.systemBlue,
      AColor.systemPink,
      AColor.systemGray,
      AColor.systemTeal,
      AColor.systemBrown,
      AColor.systemOrange,
      AColor.systemPurple,
      AColor.systemIndigo,
      AColor.systemYellow,
      AColor.systemGreen
    ]
    #else
    return [
      AColor.systemRed,
      AColor.systemBlue,
      AColor.systemPink,
      AColor.systemGray,
      AColor.systemTeal,
      AColor.systemGray6,
      AColor.systemOrange,
      AColor.systemPurple,
      AColor.systemIndigo,
      AColor.systemYellow,
      AColor.systemGreen
    ]
    #endif
  }
}

