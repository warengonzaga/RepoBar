import Foundation
@testable import repobarcli
import Testing

struct CLIOutputTests {
    @Test
    func repoLabelUsesNameWhenURLDisabled() {
        let url = URL(string: "https://github.com/steipete/RepoBar")!
        let label = formatRepoLabel(
            repoName: "steipete/RepoBar",
            repoURL: url,
            includeURL: false,
            linkEnabled: false
        )
        #expect(label == "steipete/RepoBar")
    }

    @Test
    func repoLabelUsesURLWhenEnabled() {
        let url = URL(string: "https://github.com/steipete/RepoBar")!
        let label = formatRepoLabel(
            repoName: "steipete/RepoBar",
            repoURL: url,
            includeURL: true,
            linkEnabled: false
        )
        #expect(label == url.absoluteString)
    }

    @Test
    func eventLabelUsesTextWithoutURL() {
        let label = formatEventLabel(
            text: "push",
            url: nil,
            includeURL: true,
            linkEnabled: false
        )
        #expect(label == "push")
    }

    @Test
    func eventLabelUsesURLWhenEnabled() {
        let url = URL(string: "https://github.com/steipete/RepoBar/pull/1")!
        let label = formatEventLabel(
            text: "PullRequestEvent",
            url: url,
            includeURL: true,
            linkEnabled: false
        )
        #expect(label == url.absoluteString)
    }
}
