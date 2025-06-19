//
//  Text+Replacements.swift
//  TextReplacements
//
//  Created by Daniel Saidi on 2025-04-08.
//  Copyright © 2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Text {
    
    /// Create a text view with a single text replacement.
    init(
        _ text: String,
        replace: String,
        with replacement: @escaping (String) -> Text
    ) {
        self.init(text, replacements: [replace: replacement])
    }

    /// Create a text view with multiple text replacements.
    init(
        _ text: String,
        replacements: [String: (String) -> Text]
    ) {
        self = Self.processReplacements(
            in: text,
            with: replacements
        )
    }
}

private extension Text {
    
    // swiftlint: disable shorthand_operator
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
    // swiftlint: enable shorthand_operator
}

#Preview {
    ScrollView {
        VStack {
            if #available(iOS 17, macOS 14, tvOS 17, watchOS 10, *) {
                Text(
                    "TextReplacements is a SwiftUI library that extends the Text view with ways to customize any parts of its text. The result is a Text with customized segments that can flow nicely over multiple lines.",
                    replacements: [
                        "TextReplacements": {
                            Text($0)
                                .font(.title)
                                .fontWeight(.black)
                                .fontDesign(.rounded)
                                .foregroundColor(.green)
                        },
                        "SwiftUI": {
                            Text($0)
                                .font(.headline)
                                .fontWeight(.black)
                                .fontDesign(.rounded)
                                .foregroundColor(.blue)
                        },
                        "Text": {
                            Text($0)
                                .fontWeight(.black)
                                .fontDesign(.rounded)
                                .foregroundColor(.orange)
                        },
                        "customize": {
                            Text($0)
                                .italic()
                                .underline()
                                .font(.body)
                                .fontWeight(.heavy)
                                .fontDesign(.monospaced)
                                .foregroundColor(.purple)
                        },
                        "par": {
                            Text($0)
                                .font(.headline)
                                .fontWeight(.black)
                                .fontDesign(.rounded)
                                .foregroundColor(.red)
                        },
                        "can flow nicely over multiple lines": {
                            Text($0)
                                .foregroundColor(.pink)
                        }
                    ]
                )
                .padding()
                #if os(visionOS)
                .frame(maxWidth: 350)
                .background(.ultraThickMaterial)
                .background(.white.opacity(0.5))
                .clipShape(.rect(cornerRadius: 10))
                .padding()
                .scaleEffect(2)
                #endif
            }
        }
    }
}
