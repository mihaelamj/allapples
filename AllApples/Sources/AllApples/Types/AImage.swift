//
//  AImage.swift
//  AllApples
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//  Original source: https://github.com/soffes/X

#if os(macOS)
import AppKit.NSImage
public typealias AImage = NSImage

extension AImage {
  public var cgImage: CGImage! {
    return cgImage(forProposedRect: nil, context: nil, hints: nil)
  }
  
  public convenience init?(cgImage: CGImage) {
    self.init(cgImage: cgImage, size: .zero)
  }
}
#else
import UIKit.UIImage
public typealias AImage = UIImage
#endif

#if os(iOS) || os(tvOS)
extension AImage {
  public static func named(_ name: String, in bundle: Bundle?) -> AImage? {
    return AImage(named: name, in: bundle, compatibleWith: nil)
  }
}
#elseif os(macOS)
extension AImage {
  public static func named(_ name: String, in bundle: Bundle?) -> AImage? {
    guard let bundle = bundle else {
      return AImage(named: name)
    }
    
    guard let image = bundle.image(forResource: name) else {
      return nil
    }
    
    image.setName(name)
    return image
  }
}
#endif
