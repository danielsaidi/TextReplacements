//
//  TextReplacementView.swift
//  TextReplacementView
//
//  Created by Daniel Saidi on 2025-04-08.
//  Copyright © 2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view can replace one or many substrings in a string
/// with replacement `Text` views.
public struct TextReplacementView: View {
    
    /// Create a replacement view with a single replacement.
    public init(
        _ text: String,
        replace: String,
        with replacement: @escaping (String) -> Text
    ) {
        self.init(text, replacements: [replace: replacement])
    }
    
    /// Create a replacement view with multiple replacements.
    public init(
        _ text: String,
        replacements: [String: (String) -> Text]
    ) {
        self.content = Self.processReplacements(
            in: text,
            with: replacements
        )
    }
    
    private let content: Text
    
    public var body: some View {
        content
    }
}

private extension TextReplacementView {
    
    /// Process the replacements in a deterministic way
    static func processReplacements(
        in text: String,
        with replacements: [String: (String) -> Text]
    ) -> Text {
        
        // Create a structure to track replacement positions
        struct Replacement {
            let range: Range<String.Index>
            let pattern: String
            let replacementFunc: (String) -> Text
        }
        
        // Find all occurrences of all patterns
        var allReplacements: [Replacement] = []
        
        // Find text ranges for all specified replacements
        for (pattern, replacementFunc) in replacements {
            var searchRange = text.startIndex..<text.endIndex
            
            while let range = text.range(of: pattern, range: searchRange) {
                allReplacements.append(Replacement(
                    range: range,
                    pattern: pattern,
                    replacementFunc: replacementFunc
                ))
                searchRange = range.upperBound..<text.endIndex
            }
        }
        
        // Sort replacements by position, then by length
        // Longer patterns are handled first to handle overlaps
        allReplacements.sort { first, second in
            if first.range.lowerBound != second.range.lowerBound {
                return first.range.lowerBound < second.range.lowerBound
            }
            return first.pattern.count > second.pattern.count
        }
        
        // Process the text with non-overlapping replacements
        var result = Text("")
        var currentIndex = text.startIndex
        
        // Remove overlapping replacements
        var validReplacements: [Replacement] = []
        var lastEnd: String.Index?
        
        for replacement in allReplacements {
            if let lastEnd = lastEnd, replacement.range.lowerBound < lastEnd {
                continue // Skip overlapping replacement
            }
            validReplacements.append(replacement)
            lastEnd = replacement.range.upperBound
        }
        
        // Apply the valid replacements
        for replacement in validReplacements {
            // Add text before the replacement
            if currentIndex < replacement.range.lowerBound {
                let beforeText = text[currentIndex..<replacement.range.lowerBound]
                result = result + Text(String(beforeText))
            }
            
            // Add the replacement
            result = result + replacement.replacementFunc(replacement.pattern)
            currentIndex = replacement.range.upperBound
        }
        
        // Add any remaining text
        if currentIndex < text.endIndex {
            let remainingText = text[currentIndex..<text.endIndex]
            result = result + Text(String(remainingText))
        }
        
        return result
    }
}

#Preview {
    ScrollView {
        Color.clear.frame(height: 100)
        if #available(iOS 16.1, macOS 13.1, tvOS 16.1, watchOS 9.1, *) {
            TextReplacementView(
                "TextReplacementView can be used to customize any part of a text and render the text as a collection of concatenated Text views that flow nicely over multiple lines.",
                replacements: [
                    "TextReplacementView": {
                        Text($0)
                            .font(.title.bold())
                            .fontDesign(.rounded)
                            .foregroundColor(.green)
                    },
                    "customize": {
                        Text($0)
                            .font(.body.bold())
                            .foregroundColor(.purple)
                    },
                    "part": {
                        Text($0)
                            .font(.headline)
                            .foregroundColor(.red)
                    },
                    "text": {
                        Text($0)
                            .underline()
                            .strikethrough()
                    },
                    "Text": {
                        Text($0)
                            .bold()
                            .foregroundColor(.black.opacity(0.6))
                    },
                    "flow nicely over multiple lines": {
                        Text($0)
                            .foregroundColor(.orange)
                    }
                ]
            )
            #if os(visionOS)
            .frame(maxWidth: 350)
            .padding()
            .background(.ultraThickMaterial)
            .background(.white.opacity(0.5))
            .clipShape(.rect(cornerRadius: 10))
            .padding()
            .scaleEffect(2)
            #endif
        }
    }
}
