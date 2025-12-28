enum MenuRepoScope: String, CaseIterable, Hashable {
    case all
    case pinned

    var label: String {
        switch self {
        case .all: "All"
        case .pinned: "Pinned"
        }
    }
}

import RepoBarCore

enum MenuRepoFilter: String, CaseIterable, Hashable {
    case all
    case work

    var label: String {
        switch self {
        case .all: "All"
        case .work: "Work"
        }
    }

    var onlyWith: RepositoryOnlyWith {
        switch self {
        case .all:
            return .none
        case .work:
            return RepositoryOnlyWith(requireIssues: true, requirePRs: true)
        }
    }
}
