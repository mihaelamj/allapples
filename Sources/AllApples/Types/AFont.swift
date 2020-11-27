//
//  AFont.swift
//  AllApples
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//  Original source: https://github.com/soffes/X

#if os(macOS)
import AppKit.NSFont
public typealias AFont = NSFont

extension AFont {
  public var symbolicTraits: AFontDescriptorSymbolicTraits {
    return AFontDescriptorSymbolicTraits(symbolicTraits: fontDescriptor.symbolicTraits.rawValue)
  }
}
#else
import UIKit.UIFont
public typealias AFont = UIFont

extension AFont {
  public var symbolicTraits: AFontDescriptorSymbolicTraits {
    return fontDescriptor.symbolicTraits
  }
}
#endif


extension AFont {
  public var fontWithMonospacedNumbers: AFont {
    #if os(macOS)
    let fontDescriptor = self.fontDescriptor.addingAttributes([
      NSFontDescriptor.AttributeName.featureSettings: [
        [
          NSFontDescriptor.FeatureKey.typeIdentifier: kNumberSpacingType,
          NSFontDescriptor.FeatureKey.selectorIdentifier: kMonospacedNumbersSelector
        ]
      ]
    ])
    return AFont(descriptor: fontDescriptor, size: pointSize) ?? self
    #elseif os(watchOS)
    let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize).addingAttributes([
      UIFontDescriptor.AttributeName.featureSettings: [
        [
          UIFontDescriptor.FeatureKey.featureIdentifier: 6,
          UIFontDescriptor.FeatureKey.typeIdentifier: 0
        ]
      ]
    ])
    return AFont(descriptor: fontDescriptor, size: pointSize)
    #else
    let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize).addingAttributes([
      UIFontDescriptor.AttributeName.featureSettings: [
        [
          UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
          UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector
        ]
      ]
    ])
    return AFont(descriptor: fontDescriptor, size: pointSize)
    #endif
  }
}
