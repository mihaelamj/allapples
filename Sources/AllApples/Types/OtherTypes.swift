//
//  OtherTypes.swift
//  AllApples
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//

#if os(iOS) || os(tvOS)
import UIKit

public typealias AViewController = UIViewController
public typealias ATableView = UITableView
public typealias ATableViewDataSource = UITableViewDataSource
public typealias ATableViewDelegate = UITableViewDelegate
public typealias ASplitViewController = UISplitViewController
public typealias AWindow = UIWindow
public typealias ATableViewCell = UITableViewCell
public typealias ALayoutGuide = UILayoutGuide
public typealias AImageView = UIImageView
public typealias CellClassType = UITableViewCell.Type
#endif

#if os(OSX)
import Cocoa

public typealias AViewController = NSViewController
public typealias ATableView = NSTableView
public typealias ATableViewDataSource = NSTableViewDataSource
public typealias ATableViewDelegate = NSTableViewDelegate
public typealias ASplitViewController = NSSplitViewController
public typealias AWindow = NSWindow
public typealias AImageView = NSImageView
public typealias CellClassType = AView.Type
@available(macOS 10.11, *)
public typealias ALayoutGuide = NSLayoutGuide
#endif
