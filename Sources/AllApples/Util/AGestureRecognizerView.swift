//
//  AGestureRecognizerView.swift
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

open class AGestureRecognizerView: ALayerView {
  var isOn: Bool = false

  
  // MARK: -
  // MARK: Template Overrides -
  
  override public func customInit() {
    super.customInit()
    setupRecognizers()
  }
}

// MARK: -
// MARK: Template Methods,  -

public extension AGestureRecognizerView {
  @objc func rotationChanged(degrees: Float, radians: Float) {}
  
  @objc func displacementChanged(displacement: CGPoint) {}
  
  @objc func scaleChanged(scale: CGFloat) {}
  
  @objc func tapHappened() {}
}

// MARK: -
// MARK: Setup  -

private extension AGestureRecognizerView {
  
  func setupRecognizers() {
    setupPanGestureRecognizer()
    setupClickGestureRecognizer()
    
    #if os(iOS) || os(tvOS)
    setupRotationDetector()
    setupPinchGestureRecognizer()
    #endif
  }
  
}

// MARK: -
// MARK: Movement  -

extension AGestureRecognizerView {
  
  private func setupPanGestureRecognizer() {
    let panGR = APanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
    addGestureRecognizer(panGR)
  }
  
  @objc func handlePanGesture(_ gestureRecognizer: APanGestureRecognizer) {
    let displacement: CGPoint = gestureRecognizer.translation(in: self)
    handlePan(displacement: displacement, changed: gestureRecognizer.state == .changed)
    if gestureRecognizer.state == .changed {
      gestureRecognizer.setTranslation(.zero, in: self)
    }
  }
  
}

// MARK: -
// MARK: Click / Tap  -

extension AGestureRecognizerView {
  
  private func setupClickGestureRecognizer() {
    let clickGR = ATapGestureRecognizer(target: self, action: #selector(handleClick(_:)))
    addGestureRecognizer(clickGR)
  }
  
  @objc func handleClick(_ gestureRecognizer: ATapGestureRecognizer) {
    if gestureRecognizer.state == .ended {
      handleClickTap()
    }
  }
  
}

// MARK: -
// MARK: Rotation  -

extension AGestureRecognizerView {
  
  #if os(OSX)
  public override func rotate(with event: NSEvent) {
    let rotation = event.rotation
    debugPrint("rotation in degrees is: \(rotation)")
    let radians = rotation * .pi / 180
    handleRotation(degrees: Float(rotation), radians: Float(radians))
  }
  #endif
  
  #if os(iOS) || os(tvOS)
  private func setupRotationDetector() {
    let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotateGesture(_:)))
    self.addGestureRecognizer(rotateGesture)
  }
  
  @objc func handleRotateGesture(_ gestureRecognizer: UIRotationGestureRecognizer) {
    let rotation = gestureRecognizer.rotation // in radians
    let degrees = rotation * 180 / .pi
    handleRotation(degrees: Float(degrees), radians: Float(rotation))
    gestureRecognizer.rotation = 0
  }
  #endif
}

// MARK: -
// MARK: Scale  -

extension AGestureRecognizerView {
  
  #if os(OSX)
  public override func magnify(with event: NSEvent) {
    let magnification = event.magnification
    handleMagnification(magnification: magnification)
  }
  #endif
  
  #if os(iOS) || os(tvOS)
  private func setupPinchGestureRecognizer() {
    let pinchGR = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
    addGestureRecognizer(pinchGR)
  }
  
  @objc func handlePinchGesture(_ gestureRecognizer : UIPinchGestureRecognizer) {
    guard gestureRecognizer.view != nil else { return }
    let scale = gestureRecognizer.scale
    handleScale(scale: scale)
    gestureRecognizer.scale = 1
  }
  
  #endif
}

// MARK: -
// MARK: Handling gestures,  -

private extension AGestureRecognizerView {
  
  @objc func handleRotation(degrees: Float, radians: Float) {
    rotationChanged(degrees: degrees, radians: radians)
  }
  
  @objc func handlePan(displacement: CGPoint, changed: Bool) {
    guard changed == true else { return }
    displacementChanged(displacement: displacement)
  }
  
  @objc func handleScale(scale: CGFloat) {
    scaleChanged(scale: scale)
  }
  
  @objc func handleMagnification(magnification: CGFloat) {
    scaleChanged(scale: 1 + magnification)
  }
  
  @objc func handleClickTap() {
    isOn.toggle()
    tapHappened()
  }
}
