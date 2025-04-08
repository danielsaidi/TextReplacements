<p align="center">
    <img src="Resources/Icon.png" alt="Project Icon" width="250" />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/TextReplacementView?color=%2300550&sort=semver" alt="Version" title="Version" />
    <img src="https://img.shields.io/badge/swift-6.1-orange.svg" alt="Swift 6.1" />
    <img src="https://img.shields.io/badge/platform-SwiftUI-blue.svg" alt="Swift UI" title="SwiftUI" />
    <a href="https://danielsaidi.github.io/TextReplacementView"><img src="https://img.shields.io/badge/documentation-web-blue.svg" alt="Documentation" /></a>
    <img src="https://img.shields.io/github/license/danielsaidi/TextReplacementView" alt="MIT License" title="MIT License" />
</p>



# TextReplacementView

TextReplacementView is a SwiftUI view that lets you customize the rendering of any part of a string.

<p align="center">
    <img src="Resources/Preview.jpg" />
</p>

TextReplacementView works on all major Apple platforms and is designed to be easy to use. Just provide it with a string and one or several replacements, and it will render a collection of `Text` elements.



## Installation

TextReplacementView can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/TextReplacementView.git
```



## Usage

You can create a `TextReplacementView` with a string and one or multiple text replacements.

The text view in the preview above is created like this: 

```swift
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
```

You can perform any modification to individual substrings that result in a `Text` view. This brings some limitations, like not being able to apply a background color, but lets you highlight certain parts of a text with very little effort.



## Documentation

This package will be documented once it gets more than 100 stars.



## Demo Application

This package will get a demo application once it gets more than 100 stars.



## Support my work

You can [sponsor me][Sponsors] on GitHub Sponsors or [reach out][Email] for paid support, to help support my [open-source projects][OpenSource].

Your support makes it possible for me to put more work into these projects and make them the best they can be.



## Contact

Feel free to reach out if you have questions or want to contribute in any way:

* Website: [danielsaidi.com][Website]
* E-mail: [daniel.saidi@gmail.com][Email]
* Bluesky: [@danielsaidi@bsky.social][Bluesky]
* Mastodon: [@danielsaidi@mastodon.social][Mastodon]



## License

TextReplacementView is available under the MIT license. See the [LICENSE][License] file for more info.



[Email]: mailto:daniel.saidi@gmail.com
[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi

[Bluesky]: https://bsky.app/profile/danielsaidi.bsky.social
[Mastodon]: https://mastodon.social/@danielsaidi
[Twitter]: https://twitter.com/danielsaidi

[Documentation]: https://danielsaidi.github.io/TextReplacementView/
[Getting-Started]: https://danielsaidi.github.io/TextReplacementView/documentation/textreplacementview/getting-started
[License]: https://github.com/danielsaidi/TextReplacementView/blob/master/LICENSE
