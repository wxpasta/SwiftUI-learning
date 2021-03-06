//
//  EmojiArtDocumentView+Drop.swift
//  EmojiArt
//
//  Created by CS193p Instructor on 4/27/20.
//  Copyright © 2020 Stanford University. All rights reserved.
//

import SwiftUI

// Drag and Drop code for EmojiArtDocumentView

// unchanged from during the quarter
// except for some macOS/iOS differences
// the onDrop coordinate space is different on the two platforms (see below)
// and NSImage is not an NSItemProvider like UIImage is

extension EmojiArtDocumentViewShared {
    // takes location in either view or global coordinate space (platform-dependent)
    func drop(providers: [NSItemProvider], at viewLocation: CGPoint, in geometry: GeometryProxy) -> Bool {
        // note that we are going to end up centering the dropped emoji at viewLocation
        // probably the user did not pick it up from the exact center
        // so this will result in a little bit of a disparity
        // between where the emoji is when the user lets go of the touch and where it ends up
        // TODO: fix the drop location disparity
        var location = viewLocation
#if os(iOS)
        // on iOS, the drop position appears to be in the .global coordinate space
        // (on macOS, it is in the view's coordinate space as documented)
        location = geometry.convert(location, from: .global)
#endif
        location = CGPoint(x: location.x - geometry.size.width/2, y: location.y - geometry.size.height/2)
        location = CGPoint(x: location.x - panOffset.width, y: location.y - panOffset.height)
        location = CGPoint(x: location.x / zoomScale, y: location.y / zoomScale)
        return drop(providers: providers, at: location)
    }
    
    // takes location in EmojiArt coordinate space
    private func drop(providers: [NSItemProvider], at emojiArtLocation: CGPoint) -> Bool {
        var found = providers.loadFirstObject(ofType: URL.self) { url in
            document.setBackgroundURL(url, undoManager: undoManager)
        }
        #if os(iOS)
        if !found {
            found = providers.loadObjects(ofType: UIImage.self) { image in
                if let data = image.jpegData(compressionQuality: 1.0) {
                    document.setBackgroundImageData(data, undoManager: undoManager)
                }
            }
        }
        #else
        // TODO: load up a dropped image on Mac (NSImage is not an NSItemProvider)
        #endif
        if !found {
            found = providers.loadObjects(ofType: String.self) { string in
                document.addEmoji(string, at: emojiArtLocation, size: defaultEmojiSize, undoManager: undoManager)
            }
        }
        return found
    }
}
