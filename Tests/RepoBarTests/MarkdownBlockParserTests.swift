import RepoBarCore
import Testing

struct MarkdownBlockParserTests {
    @Test("Unordered lists preserve nesting depth")
    func unorderedListNestingDepth() {
        let markdown = """
        - First
          - Child
        - Second
        """

        let blocks = MarkdownBlockParser.parse(markdown: markdown)
        #expect(blocks == [
            .listItem(marker: "•", text: "First", indentLevel: 0),
            .listItem(marker: "•", text: "Child", indentLevel: 1),
            .listItem(marker: "•", text: "Second", indentLevel: 0)
        ])
    }

    @Test("Ordered lists keep numbered markers")
    func orderedListMarkers() {
        let markdown = """
        1. One
        2. Two
        """

        let blocks = MarkdownBlockParser.parse(markdown: markdown)
        #expect(blocks == [
            .listItem(marker: "1.", text: "One", indentLevel: 0),
            .listItem(marker: "2.", text: "Two", indentLevel: 0)
        ])
    }

    @Test("Inline markdown is preserved for SwiftUI rendering")
    func inlineMarkdownIsPreserved() {
        let markdown = """
        - **Bold** and `code` [link](https://example.com)
        """

        let blocks = MarkdownBlockParser.parse(markdown: markdown)
        #expect(blocks == [
            .listItem(
                marker: "•",
                text: "**Bold** and `code` [link](https://example.com)",
                indentLevel: 0
            )
        ])
    }

    @Test("Code blocks are preserved")
    func codeBlockParsing() {
        let markdown = """
        ```swift
        let value = 1
        ```
        """

        let blocks = MarkdownBlockParser.parse(markdown: markdown)
        #expect(blocks == [
            .codeBlock(text: "let value = 1")
        ])
    }

    @Test("Block quotes render as quote blocks")
    func blockQuoteParsing() {
        let markdown = """
        > Quoted text
        """

        let blocks = MarkdownBlockParser.parse(markdown: markdown)
        #expect(blocks == [
            .blockQuote(text: "Quoted text", indentLevel: 0)
        ])
    }
}
