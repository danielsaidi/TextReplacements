<p align="center">
    <img src="Resources/Icon-Badge.png" alt="Project Icon" width="250" />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/TextReplacements?color=%2300550&sort=semver" alt="Version" title="Version" />
    <img src="https://img.shields.io/badge/swift-6.1-orange.svg" alt="Swift 6.1" />
    <img src="https://img.shields.io/badge/platform-SwiftUI-blue.svg" alt="Swift UI" title="SwiftUI" />
    <a href="https://danielsaidi.github.io/TextReplacements"><img src="https://img.shields.io/badge/documentation-web-blue.svg" alt="Documentation" /></a>
        <a href="https://github.com/danielsaidi/TextReplacements/blob/master/LICENSE"><img src="https://img.shields.io/github/license/danielsaidi/TextReplacements" alt="MIT License" /></a>
</p>



# TextReplacements

TextReplacements is a SwiftUI library that extends the `Text` view with ways to customize any parts of its text.

<p align="center">
    <img src="Resources/Preview.jpeg" />
</p>

TextReplacements works on all major Apple platforms and is designed to be easy to use.



## Installation

TextReplacements can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/TextReplacements.git
```



## Getting Started


### Text Replacements

TextReplacements let you create a `Text` with one or multiple text replacements. For instance, the preview above was created like this:

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

Since each text replacement must return a `Text` result, we can only apply view modifiers that return a `Text`. This brings some limitations, like not being able to apply a background color to individual components.


### Text Components

TextReplacements lets you initialize a `Text` view with a collection of texts and links:

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

The resulting text is rendered as Markdown, which makes it possible to use plain view modifiers to style the view. 



## Documentation

The online [documentation][Documentation] has more information, articles, code examples, etc.



## Demo Application

This package will get a demo application once it gets more than 100 stars.



## Support My Work

You can [become a sponsor][Sponsors] to help me dedicate more time on my various [open-source tools][OpenSource]. Every contribution, no matter the size, makes a real difference in keeping these tools free and actively developed.



## Contact

Feel free to reach out if you have questions or want to contribute in any way:

* Website: [danielsaidi.com][Website]
* E-mail: [daniel.saidi@gmail.com][Email]
* Bluesky: [@danielsaidi@bsky.social][Bluesky]
* Mastodon: [@danielsaidi@mastodon.social][Mastodon]



## License

TextReplacements is available under the MIT license. See the [LICENSE][License] file for more info.



[Email]: mailto:daniel.saidi@gmail.com
[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi

[Bluesky]: https://bsky.app/profile/danielsaidi.bsky.social
[Mastodon]: https://mastodon.social/@danielsaidi
[Twitter]: https://twitter.com/danielsaidi

[Documentation]: https://danielsaidi.github.io/TextReplacements/
[License]: https://github.com/danielsaidi/TextReplacements/blob/master/LICENSE
