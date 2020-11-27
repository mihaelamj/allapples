//
//  AppSceneDelegate.swift
//  AllApples
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//

import Foundation

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

public class AppSceneDelegate {
  #if os(OSX)
  public static func makeWindow_Mac(theVC: AViewController) -> AWindow? {
    let win = AWindow(contentRect: NSMakeRect(0, 0, AScreen.main?.frame.width ?? 100, AScreen.main?.frame.height ?? 100), styleMask: [.miniaturizable, .closable, .resizable, .titled], backing: .buffered, defer: false)
    win.title = "Many 🍎!"
    win.contentViewController = theVC
    win.makeKeyAndOrderFront(nil)
    return win
  }
  #endif
  
  #if os(iOS) || os(tvOS)
  @available(iOS 13.0, *)
  public static func makeWindow_iOS(theScene:UIWindowScene, theVC: AViewController) -> AWindow {
    let window = AWindow(frame: theScene.coordinateSpace.bounds)
    window.windowScene = theScene
    window.rootViewController = theVC
    window.makeKeyAndVisible()
    return window
  }
  #endif
}
