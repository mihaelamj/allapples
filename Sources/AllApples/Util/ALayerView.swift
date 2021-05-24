//
//  ALayerView.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 23.05.2021..
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

open class ALayerView: AView {
  
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

private extension ALayerView {
  func setupLayerInternal() {
    #if os(OSX)
    makeLikeUIView()
    #endif
  }
}

