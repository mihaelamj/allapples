//
//  File.swift
//  AllApples
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//  Original source: https://github.com/soffes/X

import Foundation
import CoreGraphics

#if os(macOS)
public func NSStringFromCGSize(_ size: CGSize) -> String! {
  return NSStringFromSize(size)
}

public func CGSizeFromString(_ string: String!) -> CGSize {
  return NSSizeFromString(string) as CGSize
}
#else
import UIKit
#endif


extension CGSize {
  public var stringRepresentation: String {
    #if os(macOS)
    return NSStringFromCGSize(self)
    #else
    return NSCoder.string(for: self)
    #endif
  }
  
  public init(string: String) {
    #if os(macOS)
    self = CGSizeFromString(string)
    #else
    self = NSCoder.cgSize(for: string)
    #endif
  }
  
  public var integral: CGSize {
    return CGSize(width: ceil(width), height: ceil(height))
  }
  
  public func aspectFit(_ boundingSize: CGSize) -> CGSize {
    let aspectRatio = self
    var size = boundingSize
    let widthRatio = boundingSize.width / aspectRatio.width
    let heightRatio = boundingSize.height / aspectRatio.height
    if widthRatio < heightRatio {
      size.height = boundingSize.width / aspectRatio.width * aspectRatio.height
    } else if (heightRatio < widthRatio) {
      size.width = boundingSize.height / aspectRatio.height * aspectRatio.width
    }
    return size
  }
  
  public func aspectFill(_ minimumSize: CGSize) ->  CGSize {
    let aspectRatio = self
    var size = minimumSize
    let widthRatio = minimumSize.width / aspectRatio.width
    let heightRatio = minimumSize.height / aspectRatio.height
    if widthRatio > heightRatio {
      size.height = minimumSize.width / aspectRatio.width * aspectRatio.height
    } else if heightRatio > widthRatio {
      size.width = minimumSize.height / aspectRatio.height * aspectRatio.width
    }
    return size
  }
}
