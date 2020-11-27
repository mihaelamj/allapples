//
//  AEdgeInsets.swift
//  AllApples
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//  Original source: https://github.com/soffes/X

#if os(macOS)
import AppKit
public typealias AEdgeInsets = NSEdgeInsets
#else
import UIKit
public typealias AEdgeInsets = UIEdgeInsets
#endif


extension AEdgeInsets {
  #if os(macOS)
  public static let zero = AEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  #endif
  
  public var flipped: AEdgeInsets {
    var insets = self
    insets.top = bottom
    insets.bottom = top
    return insets
  }
  
  public func insetRect(rect: CGRect) -> CGRect {
    #if os(macOS)
    if (top + bottom > rect.size.height) || (left + right > rect.size.width) {
      return .null
    }
    
    var insetRect = rect
    insetRect.origin.x += left
    insetRect.origin.y += top;
    insetRect.size.height -= top + bottom
    insetRect.size.width -= left + right
    return insetRect
    #else
    return rect.inset(by: self)
    #endif
  }
}
