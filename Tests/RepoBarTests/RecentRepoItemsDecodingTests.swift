import Foundation
@testable import RepoBarCore
import Testing

struct RecentRepoItemsDecodingTests {
    @Test
    func issuesEndpointFiltersOutPullRequests() throws {
        let json = """
        [
          {
            "number": 1,
            "title": "Issue one",
            "html_url": "https://github.com/acme/widget/issues/1",
            "updated_at": "2025-12-28T10:00:00Z",
            "user": { "login": "alice" }
          },
          {
            "number": 2,
            "title": "PR (should not appear as issue)",
            "html_url": "https://github.com/acme/widget/pull/2",
            "updated_at": "2025-12-28T12:00:00Z",
            "user": { "login": "bob" },
            "pull_request": {}
          }
        ]
        """

        let items = try GitHubClient.decodeRecentIssues(from: Data(json.utf8))
        #expect(items.count == 1)
        #expect(items.first?.number == 1)
        #expect(items.first?.authorLogin == "alice")
    }

    @Test
    func pullsEndpointMapsDraftAndAuthor() throws {
        let json = """
        [
          {
            "number": 42,
            "title": "Add repo submenu items",
            "html_url": "https://github.com/acme/widget/pull/42",
            "updated_at": "2025-12-27T09:30:00Z",
            "draft": true,
            "user": { "login": "steipete" }
          }
        ]
        """

        let items = try GitHubClient.decodeRecentPullRequests(from: Data(json.utf8))
        #expect(items.count == 1)
        #expect(items.first?.number == 42)
        #expect(items.first?.isDraft == true)
        #expect(items.first?.authorLogin == "steipete")
    }
}
