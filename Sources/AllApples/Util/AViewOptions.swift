//
//  AViewOptions.swift
//  AllApplesWIP
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

import Foundation

/**
 `Like UIKit`
 
 wantsLayer = true
 wantsUpdateLayer = true
 isFlipped = true
 layerContentsRedrawPolicy = .onSetNeedsDisplay
 */

public struct AViewOptions: OptionSet {
  public let rawValue: Int
  public typealias RawValue = Int
  
  public init(rawValue: AViewOptions.RawValue) {
      self.rawValue = rawValue
  }
  
  public static let wantsLayer = AViewOptions(rawValue: 1 << 0)
  public static let wantsUpdateLayer = AViewOptions(rawValue: 1 << 1)
  public static let isFlipped = AViewOptions(rawValue: 1 << 2)
  
  // If the canDrawSubviewsIntoLayer property is set to true, the view ignores the value returned by this method.
  // Instead, the view always uses its draw(_:) method to draw its content.
  public static let canDrawSubviewsIntoLayer = AViewOptions(rawValue: 1 << 3) // for using `drawRect`
  
  public static let contentsRedrawPolicyIsOnSetNeedsDisplay = AViewOptions(rawValue: 1 << 4)
  
  public static let likeUIKit: AViewOptions  = [.wantsLayer, .wantsUpdateLayer, .isFlipped, .contentsRedrawPolicyIsOnSetNeedsDisplay]
  public static let `default`: AViewOptions  = [.wantsLayer]
  public static let onlyDrawRect: AViewOptions  = [.canDrawSubviewsIntoLayer]
  public static let all: AViewOptions = [.wantsLayer, .wantsUpdateLayer, .isFlipped, .canDrawSubviewsIntoLayer, contentsRedrawPolicyIsOnSetNeedsDisplay]
}

