import Testing
@testable import RepoBar

struct PKCETests {
    @Test
    func verifierAndChallengeNotEmpty() {
        let pkce = PKCE.generate()
        #expect(!pkce.verifier.isEmpty)
        #expect(!pkce.challenge.isEmpty)
    }
}
