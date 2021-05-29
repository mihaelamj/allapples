//
//  ACustomView.swift
//  AllApplesWIP
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

public class ACustomView: AView {
  
  var viewOptions: AViewOptions = .likeUIKit
  
  #if os(OSX)
  // set geometry like UIView
  open override var isFlipped: Bool {
    return viewOptions.contains(.isFlipped)
  }
  
  open override var wantsUpdateLayer : Bool {
    return viewOptions.contains(.wantsUpdateLayer)
  }
  #endif
  
  // MARK: -
  // MARK: Init -
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setupLayerInternal()
    customInit()
  }
  
  required public init() {
    super.init(frame: .zero)
    setupLayerInternal()
    customInit()
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -
  // MARK: Abstract Template -
  
  open func customInit() { }
}

private extension ACustomView {
  func setupLayerInternal() {
    #if os(OSX)
    wantsLayer = viewOptions.contains(.wantsLayer)
    canDrawSubviewsIntoLayer = viewOptions.contains(.canDrawSubviewsIntoLayer)
    if viewOptions.contains(.contentsRedrawPolicyIsOnSetNeedsDisplay) {
      layerContentsRedrawPolicy = .onSetNeedsDisplay
    }
    #endif
  }
}
