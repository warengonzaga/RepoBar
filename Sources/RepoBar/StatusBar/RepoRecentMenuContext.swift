import Foundation

enum RepoRecentMenuKind: Hashable {
    case issues
    case pullRequests
}

struct RepoRecentMenuContext: Hashable {
    let fullName: String
    let kind: RepoRecentMenuKind
}
