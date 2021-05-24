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

public class ALayerView: AView {
  
  // MARK: -
  // MARK: Init -
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayerInternal()
    customInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupLayerInternal()
    customInit()
  }
  
  convenience init() {
    self.init(frame: .zero)
  }
  
  // MARK: -
  // MARK: Abstract Template -
  
  public func customInit() {
    debugPrint("customInit")
  }
  
}

private extension ALayerView {
  func setupLayerInternal() {
    debugPrint("setupLayerInternal")
    #if os(OSX)
    makeLikeUIView()
    #endif
  }
}

#if os(OSX)
class ColorView: AView {
  override var wantsUpdateLayer : Bool {
    get { return true }
  }
  
  override func updateLayer() {
    self.layer?.backgroundColor = NSColor.systemRed.cgColor
  }
}
#endif
