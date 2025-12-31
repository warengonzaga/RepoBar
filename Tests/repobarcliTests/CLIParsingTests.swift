import Commander
@testable import repobarcli
import Testing

struct CLIParsingTests {
    @Test
    func parseRepoNameSplitsOwnerAndName() throws {
        let result = try parseRepoName("steipete/RepoBar")
        #expect(result.owner == "steipete")
        #expect(result.name == "RepoBar")
    }

    @Test
    func parseRepoNameRejectsMissingSlash() {
        #expect(throws: ValidationError.self) {
            _ = try parseRepoName("RepoBar")
        }
    }
}
