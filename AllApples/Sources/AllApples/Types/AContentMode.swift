//
//  AContentMode.swift
//  AllApples
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//  Original source: https://github.com/soffes/X

#if os(macOS) || os(watchOS)
public enum AContentMode : Int {
  case scaleToFill
  case scaleAspectFit
  case scaleAspectFill
  case redraw
  case center
  case top
  case bottom
  case left
  case right
  case topLeft
  case topRight
  case bottomLeft
  case bottomRight
}
#elseif os(iOS) || os(tvOS)
import UIKit.UIView
public typealias AContentMode = UIView.ContentMode
#endif
