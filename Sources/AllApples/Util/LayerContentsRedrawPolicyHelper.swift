//
//  LayerContentsRedrawPolicyHelper.swift
//  AllApplesWIP
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

import Foundation

#if os(OSX)
import Cocoa

public extension NSView.LayerContentsRedrawPolicy {
  func toString() -> String {
    switch self {
      case .never:
        return "never"
      case .beforeViewResize:
        return "beforeViewResize"
      case .onSetNeedsDisplay:
        return "onSetNeedsDisplay"
      case .duringViewResize:
        return "duringViewResize"
      case .crossfade:
        return "crossfade"
      default:
        return "none"
    }
  }
  
  func explanation() -> String {
    switch self {
      case .never:
        return "Leave the layer's contents alone. Never mark the layer as needing display, or draw the view's contents to the layer. This is how developer created layers (layer-hosting views) are treated."
      case .beforeViewResize:
        return "Resize the layer and redraw the view to the layer when the view's size changes. This will be done just once at the beginning of a resize animation, not at each frame of the animation. Affected parts of the layer will also be redrawn when the view is marked as needing display. This mode is a superset of `NSView.LayerContentsRedrawPolicy.onSetNeedsDisplay`."
      case .onSetNeedsDisplay:
        return "Any of the setNeedsDisplay methods sent to the view will cause the view redraw the affected layer parts by invoking the view's `draw(_:)`, but neither the layer or the view are marked as needing display when the view's size changes."
      case .duringViewResize:
        return "Resize the view’s backing-layer and redraw the view to the layer when the view's size changes. If the resize is animated, AppKit will drive the resize animation itself and will do this resize and redraw at each step of the animation. Affected parts of the layer will also be redrawn when the view is marked as needing display. This mode is a superset of `NSView.LayerContentsRedrawPolicy.onSetNeedsDisplay`. This is the way that layer-backed views are currently treated."
      case .crossfade:
        return "Redraw the layer contents at the new size and crossfade from the old contents to the new contents. Use this in conjunction with the `NSView.LayerContentsPlacement` constants to get a nice crossfade animation for complex layer-backed views that cannot update correctly at each step of the animation."
      default:
        return "none"
    }
  }
}

public extension String {
  func toLayerContentsRedrawPolicy() -> NSView.LayerContentsRedrawPolicy {
    switch self {
      case "never":
        return .never
      case "beforeViewResize":
        return .beforeViewResize
      case "onSetNeedsDisplay":
        return .onSetNeedsDisplay
      case "duringViewResize":
        return .duringViewResize
      case "crossfade":
        return .crossfade
      default:
        return .never
    }
  }
}
#endif

#if os(iOS) || os(tvOS)
import UIKit

public extension UIView {
  func myLayerContentsRedrawPolicy() -> String {
    return "onSetNeedsDisplay"
  }
  
  func myLayerContentsRedrawPolicyExplanation() -> String {
    return "Any of the setNeedsDisplay methods sent to the view will cause the view redraw the affected layer parts by invoking the view's `draw(_:)`, but neither the layer or the view are marked as needing display when the view's size changes."
  }
}
#endif
