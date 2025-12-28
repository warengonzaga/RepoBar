import Foundation
@testable import RepoBarCore
import Testing

struct RepoDetailStoreTests {
    @Test
    func cachePolicyMarksFreshAndStale() {
        let now = Date(timeIntervalSinceReferenceDate: 1_000_000)
        let cache = RepoDetailCache(
            openPulls: 1,
            openPullsFetchedAt: now.addingTimeInterval(-7200),
            ciDetails: nil,
            ciFetchedAt: now.addingTimeInterval(-600),
            latestActivity: nil,
            activityEvents: nil,
            activityFetchedAt: nil,
            traffic: nil,
            trafficFetchedAt: nil,
            heatmap: nil,
            heatmapFetchedAt: nil,
            latestRelease: nil,
            releaseFetchedAt: nil
        )
        let policy = RepoDetailCachePolicy(
            openPullsTTL: 3600,
            ciTTL: 3600,
            activityTTL: 3600,
            trafficTTL: 3600,
            heatmapTTL: 3600,
            releaseTTL: 3600
        )

        let state = policy.state(for: cache, now: now)
        #expect(state.openPulls == .stale)
        #expect(state.ci == .fresh)
        #expect(state.activity == .missing)
    }

    @Test
    func storeUsesMemoryAfterDiskRemoval() throws {
        let baseURL = FileManager.default.temporaryDirectory.appending(path: "repobar-cache-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: baseURL) }

        let diskStore = RepoDetailCacheStore(fileManager: .default, baseURL: baseURL)
        var store = RepoDetailStore(diskStore: diskStore)
        let apiHost = URL(string: "https://api.github.com")!
        let cache = RepoDetailCache(openPulls: 5)

        store.save(cache, apiHost: apiHost, owner: "steipete", name: "RepoBar")

        let cacheFile = baseURL
            .appending(path: "api.github.com")
            .appending(path: "steipete")
            .appending(path: "RepoBar.json")
        try? FileManager.default.removeItem(at: cacheFile)

        let loaded = store.load(apiHost: apiHost, owner: "steipete", name: "RepoBar")
        #expect(loaded.openPulls == 5)
    }
}
