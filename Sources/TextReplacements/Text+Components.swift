//
//  Text+Components.swift
//  TextReplacements
//
//  Created by Daniel Saidi on 2025-06-19.
//  Copyright © 2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// Create a text view that mixes plain texts and links.
///
/// The view is initialized with ``TextComponent`` items, which are converted
/// to Markdown content.
///
/// You can use ``SwiftUICore/View/textLinkStyle(_:)`` to style links,
/// `.tint` to color them and `.foregroundStyle` to color text.
@MainActor
public func Text(_ components: [TextComponent]) -> some View {
    TextComponentView(components)
}

/// Create a text view that mixes plain texts and links.
///
/// The view is initialized with ``TextComponent`` items, which are converted
/// to Markdown content.
///
/// You can use ``SwiftUICore/View/textLinkStyle(_:)`` to style links,
/// `.tint` to color them and `.foregroundStyle` to color text. 
@MainActor
public func Text(_ components: TextComponent...) -> some View {
    TextComponentView(components)
}

/// This enum defines supported text component types.
public enum TextComponent {

    /// Plain text.
    case text(String)

    /// A link with a text and a link.
    case link(String, URL?, TextComponent.LinkStyle? = nil)
}

public extension TextComponent {

    /// This style can style ``TextComponent/link(_:_:_:)``s.
    ///
    /// Use ``SwiftUICore/View/textLinkStyle(_:)`` to inject
    /// a custom custom link style into a view hierarchy.
    struct LinkStyle {

        public init(
            bold: Bool = false,
            italic: Bool = false
        ) {
            self.bold = bold
            self.italic = italic
        }

        public var bold: Bool
        public var italic: Bool
    }
}

public extension TextComponent.LinkStyle {

    /// The standard, plain link text style.
    static var standard: Self { .init() }

    /// A bold link style.
    static var bold: Self { .init(bold: true) }

    /// A bold, italic link style.
    static var boldItalic: Self {
        .init(bold: true, italic: true)
    }

    /// An italic link style.
    static var italic: Self { .init(italic: true) }
}

public extension EnvironmentValues {

    @Entry var textLinkStyle: TextComponent.LinkStyle = .standard
}

public extension View {

    /// Apply a custom ``TextComponent/LinkStyle`` value.
    func textLinkStyle(
        _ style: TextComponent.LinkStyle
    ) -> some View {
        self.environment(\.textLinkStyle, style)
    }
}

private struct TextComponentView: View {

    init(_ components: [TextComponent]) {
        self.components = components
    }

    init(_ components: TextComponent...) {
        self.components = components
    }

    @Environment(\.textLinkStyle)
    private var linkStyle

    private let components: [TextComponent]

    var body: some View {
        Text(markdownText)
    }

    var markdownText: LocalizedStringKey {
        .init(stringLiteral: components.map {
            $0.markdown(linkStyle)
        }.joined(separator: " "))
    }
}

private extension TextComponent {

    func markdown(
        _ viewStyle: TextComponent.LinkStyle
    ) -> String {
        switch self {
        case .text(let text): text
        case .link(let text, let url, let style):
            "[\(text)](\(url?.absoluteString ?? ""))"
                .markdownBold(if: (style ?? viewStyle).bold)
                .markdownItalic(if: (style ?? viewStyle).italic)
        }
    }
}

private extension String {

    func markdownBold(if condition: Bool) -> String {
        condition ? "**\(self)**" : self
    }

    func markdownItalic(if condition: Bool) -> String {
        condition ? "*\(self)*" : self
    }
}

#Preview {
    ScrollView {
        Text(
            .text("You must accept our"),
            .link("terms & conditions", .init(string: "https://danielsaidi.com")),
            .text("to use this app. See our"),
            .link("website", .init(string: "https://danielsaidi.com")),
            .text("for more information.")
        )
        .textLinkStyle(.bold)
        .accentColor(.orange)
        .foregroundColor(.blue)
        .padding()
    }
}
