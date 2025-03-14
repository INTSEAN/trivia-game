# Important Note About Using Nuke Image Library

## Nuke Version Compatibility Issue

When working with the Nuke image library for iOS apps, there's an important version compatibility issue to be aware of:

### The Issue

The lab example uses Nuke 9.6.1 with a method call like this:
```swift
Nuke.loadImage(with: imageUrl, into: cell.albumImageView)
```

However, in newer versions of Nuke (12.x+), this method has been moved to the **NukeExtensions** library, which requires separate installation.

### Solution Options

#### Option 1: Specify Nuke 9.6.1 in your Package Dependencies (Recommended for this project)

When adding the Swift Package dependency, you can specify version 9.6.1 explicitly:

1. In Xcode, go to File > Add Packages...
2. Enter the URL: `https://github.com/kean/Nuke.git`
3. In the Version options, select "Up to Next Major" and type `9.6.1`
4. Click "Add Package"

With this approach, you can use the original method call as in the lab example:
```swift
Nuke.loadImage(with: imageUrl, into: cell.albumImageView)
```

#### Option 2: Use the Latest Version with NukeExtensions

If you want to use the latest version of Nuke (12.x+):

1. Add both the Nuke and NukeExtensions packages:
   - Nuke: `https://github.com/kean/Nuke.git`
   - NukeExtensions: `https://github.com/kean/NukeExtensions.git`

2. Import both libraries in your file:
```swift
import Nuke
import NukeExtensions
```

3. Use the appropriate method from NukeExtensions:
```swift
NukeExtensions.loadImage(with: imageUrl, into: cell.albumImageView)
// or
ImageLoadingOptions.shared.pipeline.loadImage(with: imageUrl, into: cell.albumImageView)
```

### Documentation

For more information, refer to the official documentation:
- [Nuke GitHub Repository](https://github.com/kean/Nuke)
- [Nuke Documentation](https://kean.blog/nuke/guides/welcome) 