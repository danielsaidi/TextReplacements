<p align="center">
    <img src="Resources/Icon.png" alt="Project Icon" width="250" />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/TextReplacements?color=%2300550&sort=semver" alt="Version" title="Version" />
    <img src="https://img.shields.io/badge/swift-6.1-orange.svg" alt="Swift 6.1" />
    <img src="https://img.shields.io/badge/platform-SwiftUI-blue.svg" alt="Swift UI" title="SwiftUI" />
    <a href="https://danielsaidi.github.io/TextReplacements"><img src="https://img.shields.io/badge/documentation-web-blue.svg" alt="Documentation" /></a>
    <img src="https://img.shields.io/github/license/danielsaidi/TextReplacements" alt="MIT License" title="MIT License" />
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



## Usage

TextReplacements let you initialize a `Text` view with a string and one or multiple text replacements.

The text view in the preview above is created like this:

```swift
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
                .foregroundColor(.black.opacity(0.6))
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
                .foregroundColor(.orange)
        }
    ]
)
```

You can perform any modification that result in new `Text` views. This brings some limitations, like not being able to apply a background color, but lets you highlight certain parts of a text with very little effort.



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
[Getting-Started]: https://danielsaidi.github.io/TextReplacements/documentation/textreplacements/getting-started
[License]: https://github.com/danielsaidi/TextReplacements/blob/master/LICENSE
