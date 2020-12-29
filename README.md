# SlackBlockKitBuilder

## Description
SlackBlockKitBuilder is a DSL build to create Slack messages.

## Usage

To use the library you need to import it.

```swift
import SlackBlockKitBuilder 
```

Create an instance of Message with the blocks you want in your message.
```swift
let message = Message {
    Section {
        PlainText(text: "Hello")
            .emoji(true)
    }
    Section {
        PlainText(text: "World")
            .emoji(true)
    }
}
```

For more information on the BlockKit-API please visit the [Slack documentation](https://api.slack.com/block-kit)
