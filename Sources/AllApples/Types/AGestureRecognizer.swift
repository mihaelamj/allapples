//
//  AGestureRecognizer.swift
//  AllApples
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//  Original source: https://github.com/soffes/X

#if os(iOS) || os(tvOS)
import UIKit.UIGestureRecognizer
public typealias AGestureRecognizer = UIGestureRecognizer
public typealias ATapGestureRecognizer = UITapGestureRecognizer

public typealias APanGestureRecognizer = UIPanGestureRecognizer

#elseif os(macOS)
import AppKit.NSGestureRecognizer
@available(OSX 10.10, *) public typealias AGestureRecognizer = NSGestureRecognizer
@available(OSX 10.10, *) public typealias ATapGestureRecognizer = NSClickGestureRecognizer

@available(OSX 10.10, *) public typealias APanGestureRecognizer = NSPanGestureRecognizer
#endif
