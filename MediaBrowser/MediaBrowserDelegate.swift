//
//  MediaBrowserDelegate.swift
//  MediaBrowser
//
//  Created by Seungyoun Yi on 2017. 9. 6..
//  Copyright © 2017년 Seungyoun Yi. All rights reserved.
//

import UIKit

/// Required delegate to use MediaBrowser
@objc
public protocol MediaBrowserDelegate {
    //MARK: Required methods
    
    /**
     Required protocol to use MediaBrowser. return media count
     
     - Parameter mediaBrowser: MediaBrowser
     */
    @objc func numberOfMedia(in mediaBrowser: MediaBrowser) -> Int
    
    /**
     Required protocol to use MediaBrowser. return media
     
     - Parameter mediaBrowser: MediaBrowser
     - Parameter index: Int
     */
    @objc func media(for mediaBrowser: MediaBrowser, at index: Int) -> Media
    
    //MARK: Optional methods
    
    /**
     Optional protocol to mediaBrowser Did Finish Modal Presentation
     
     - Parameter mediaBrowser: MediaBrowser
     */
    @objc optional func mediaBrowserDidFinishModalPresentation(mediaBrowser: MediaBrowser)

    /**
     Optional protocol to show thumbnail. return media.
     Recommand small size
     
     - Parameter mediaBrowser: MediaBrowser
     - Parameter index: Int
     */
    @objc optional func thumbnail(for mediaBrowser: MediaBrowser, at index: Int) -> Media

    /**
     Optional protocol to show captionView. return MediaCaptionView.
     
     - Parameter mediaBrowser: MediaBrowser
     - Parameter index: Int
     */
    @objc optional func captionView(for mediaBrowser: MediaBrowser, at index: Int) -> MediaCaptionView?
    
    /**
     Optional protocol when need callback
     
     - Parameter index: Int
     - Parameter mediaBrowser: MediaBrowser
     */
    @objc optional func didDisplayMedia(at index: Int, in mediaBrowser: MediaBrowser)
    
    /**
     Optional protocol when need callback about action button
     
     - Parameter photoIndex: Int
     - Parameter mediaBrowser: MediaBrowser
     */
    @objc optional func actionButtonPressed(at photoIndex: Int, in mediaBrowser: MediaBrowser, sender: Any?)
    
    /**
     Optional protocol when need callback about isMediaSelected
     
     - Parameter index: Int
     - Parameter mediaBrowser: MediaBrowser
     */
    @objc optional func isMediaSelected(at index: Int, in mediaBrowser: MediaBrowser) -> Bool
    
    /**
     Optional protocol when need callback about media selection
     
     - Parameter selected: Bool
     - Parameter index: Int
     - Parameter mediaBrowser: MediaBrowser
     */
    @objc optional func mediaDid(selected: Bool, at index: Int, in mediaBrowser: MediaBrowser)
    
    /**
     Optional protocol for title
     
     - Parameter mediaBrowser: MediaBrowser
     - Parameter index: Int
     */
    @objc optional func title(for mediaBrowser: MediaBrowser, at index: Int) -> String?
    
    /**
     Optional protocol for grid cells resizing
     - Returns: Optional CGSize
     */
    @objc optional func gridCellSize() -> CGSize

    /**
     Optional protocol for access token
     */
    @objc optional func accessToken(for url: URL?) -> String?
}

public extension MediaBrowserDelegate {
    func mediaBrowserDidFinishModalPresentation(mediaBrowser: MediaBrowser) {
        mediaBrowser.dismiss(animated: true, completion: nil)
    }

    func thumbnail(for mediaBrowser: MediaBrowser, at index: Int) -> Media { return Media() }

    func captionView(for mediaBrowser: MediaBrowser, at index: Int) -> MediaCaptionView? { return nil }
    
    func didDisplayMedia(at index: Int, in mediaBrowser: MediaBrowser) { }
    
    func actionButtonPressed(at photoIndex: Int, in mediaBrowser: MediaBrowser, sender: Any? = nil) { mediaBrowser.defaultActionForMedia(atIndex: photoIndex) }
    
    func isMediaSelected(at index: Int, in mediaBrowser: MediaBrowser) -> Bool { return false }
    
    func mediaDid(selected: Bool, at index: Int, in mediaBrowser: MediaBrowser) { }
    
    func title(for mediaBrowser: MediaBrowser, at index: Int) -> String? { return nil }
    
    func gridCellSize() -> CGSize { return CGSize(width: 128, height: 128) }

    func accessToken(for url: URL?) -> String? { return nil }
}
