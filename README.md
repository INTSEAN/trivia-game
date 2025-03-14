# iOS 101: Trivia Game Project

This is a simple trivia game for iOS that satisfies the following requirements:

## Features Implemented

### Required Features
- A user can view the current question and 4 different answers
- A user can select an answer and proceed to the next question
- The game includes 5 different trivia questions

### Stretch Features
- The app works properly in vertical orientation on any device size
- A user can track which question they're currently on and how much they have left
- A user can view their score after answering all questions
- A user can restart the game after answering all questions

## Setup Instructions

1. Clone this repository
2. Open the Trivia.xcodeproj file in Xcode
3. Build and run the project

## Important Note about Nuke Library

If you're working with this project and plan to use the Nuke image loading library, please read the [NUKE_NOTES.md](NUKE_NOTES.md) file for important information about version compatibility issues and solutions.

The lab example uses Nuke 9.6.1 with a method call like:
```swift
Nuke.loadImage(with: imageUrl, into: cell.albumImageView)
```

In newer versions of Nuke (12.x+), this method has been moved to the NukeExtensions library. See [NUKE_NOTES.md](NUKE_NOTES.md) for detailed instructions on how to handle this.