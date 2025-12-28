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
