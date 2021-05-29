//
//  AView.swift
//  AllApples
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//  Original source: https://github.com/soffes/X

#if os(iOS) || os(tvOS)
import UIKit.UIView
public typealias ViewType = UIView
#elseif os(macOS)
import AppKit.NSView
public typealias ViewType = NSView
#endif

#if os(iOS) || os(tvOS) || os(macOS)
open class AView: ViewType {
  
  public var forcedLayer: CALayer {
    #if os(iOS) || os(tvOS)
    return layer
    #endif
    
    #if os(OSX)
    guard let aLayer = layer else {
      fatalError("Layer == `nil`")
    }
    return aLayer
    #endif
  }
  
  public var myColor: AColor? {
    set {
      #if os(iOS) || os(tvOS)
      backgroundColor = newValue
      #endif
      
      #if os(OSX)
      layer?.backgroundColor = newValue?.cgColor
      #endif
    }
    get {
      #if os(iOS) || os(tvOS)
      return backgroundColor
      #endif
      
      #if os(OSX)
      guard let aCgColor = layer?.backgroundColor else { return nil }
      return NSColor(cgColor: aCgColor)
      #endif
    }
  }
  
//  #if os(OSX)
//  // set geometry like UIView
//  open override var isFlipped: Bool {
//    return true
//  }
//
//  open override var wantsUpdateLayer : Bool {
//    return true
//  }
//  #endif
  
  #if os(macOS)
  open var userInteractionEnabled: Bool {
    return true
  }
  
  open override func viewDidMoveToWindow() {
    didMoveToWindow()
  }
  
  open func didMoveToWindow() {
    super.viewDidMoveToWindow()
  }
  
  open override func viewDidMoveToSuperview() {
    didMoveToSuperview()
  }
  
  open func didMoveToSuperview() {
    super.viewDidMoveToSuperview()
  }
  
  open override func layout() {
    layoutSubviews()
  }
  
  open func layoutSubviews() {
    super.layout()
  }
  #else
  open var wantsLayer: Bool {
    set {
      // Do nothing
    }
    
    get {
      return true
    }
  }
  #endif
}
#endif

