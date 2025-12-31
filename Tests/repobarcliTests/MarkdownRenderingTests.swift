@testable import repobarcli
import Testing

struct MarkdownRenderingTests {
    @Test
    func rendersAnsiWhenColorEnabled() {
        let markdown = """
        # Heading

        - Item 1
        - Item 2
        """
        let output = renderMarkdown(
            markdown,
            request: MarkdownRenderRequest(width: 40, wrap: true, color: true, plain: false)
        )
        #expect(output.contains("\u{001B}["))
        #expect(output.contains("Heading"))
    }

    @Test
    func stripsAnsiWhenPlain() {
        let markdown = """
        # Heading

        - Item 1
        """
        let output = renderMarkdown(
            markdown,
            request: MarkdownRenderRequest(width: 40, wrap: true, color: true, plain: true)
        )
        #expect(output.contains("\u{001B}[") == false)
        #expect(output.contains("Heading"))
    }
}
