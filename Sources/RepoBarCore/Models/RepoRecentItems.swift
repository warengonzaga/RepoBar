import Foundation

public struct RepoIssueSummary: Sendable, Hashable {
    public let number: Int
    public let title: String
    public let url: URL
    public let updatedAt: Date
    public let authorLogin: String?

    public init(number: Int, title: String, url: URL, updatedAt: Date, authorLogin: String?) {
        self.number = number
        self.title = title
        self.url = url
        self.updatedAt = updatedAt
        self.authorLogin = authorLogin
    }
}

public struct RepoPullRequestSummary: Sendable, Hashable {
    public let number: Int
    public let title: String
    public let url: URL
    public let updatedAt: Date
    public let authorLogin: String?
    public let isDraft: Bool

    public init(number: Int, title: String, url: URL, updatedAt: Date, authorLogin: String?, isDraft: Bool) {
        self.number = number
        self.title = title
        self.url = url
        self.updatedAt = updatedAt
        self.authorLogin = authorLogin
        self.isDraft = isDraft
    }
}
