# ``TextReplacements``

Extends the `Text` view with ways to customize any parts of its text.


## Overview

![Library logo](Logo.png)

TextReplacements is a SwiftUI library that extends the `Text` view with ways to customize any parts of its text, on all Apple platforms.



## Installation

TextReplacements can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/TextReplacements.git
```



## Supported Platforms

TextReplacements supports iOS 13, macOS 11, tvOS 13, watchOS 7, and visionOS 1.



## Getting Started

TextReplacements lets you create a regular ``SwiftUICore/Text`` with a text and text replacements, or create a ``SwiftUICore/Text`` with text and link components.

### Text Replacements

TextReplacements let you create a ``SwiftUICore/Text`` with one or multiple text replacements. For instance, this replaces words with styled variants:

```swift
Text(
    "TextReplacements is a SwiftUI library that extends the Text view...",
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
                .foregroundColor(.primary.opacity(0.6))
        }
        ...
    ]
)
```

Since each text replacement must return a ``SwiftUICore/Text``, we can only apply view modifiers that return a ``SwiftUICore/Text``. This brings some limitations, like not being able to apply a background color to individual components.


### Text Components

TextReplacements lets you initialize a ``SwiftUICore/Text`` view with a collection of texts and links, after which you can use ``SwiftUICore/View/textLinkStyle(_:)`` to style the links:

```swift
Text(
    .text("You must accept our"),
    .link("terms & conditions", .init(string: "https://danielsaidi.com")),
    .text("to use this app. See our"),
    .link("website", .init(string: "https://danielsaidi.com")),
    .text("for more information.")
)
.textLinkStyle(.boldItalic)
.accentColor(.orange)
.foregroundColor(.blue)
.padding()
```

The result is a ``SwiftUICore/Text`` that is rendered as Markdown, with `.foregroundColor` applied to text, `.accentColor` applied to links, and `.textLinkStyle` used to style links further. 




## Repository

For more information, source code, etc., visit the [project repository][Project].



## License

TextReplacements is available under the MIT license.



[Email]: mailto:daniel.saidi@gmail.com
[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi

[Project]: https://github.com/danielsaidi/TextReplacements
