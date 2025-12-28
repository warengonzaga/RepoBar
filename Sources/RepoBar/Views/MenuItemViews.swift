import RepoBarCore
import SwiftUI

struct RepoMenuCardView: View {
    let repo: RepositoryViewModel
    let isPinned: Bool
    let isHighlighted: Bool
    let showsSubmenuIndicator: Bool
    let showsSeparator: Bool
    let showHeatmap: Bool
    let heatmapSpan: HeatmapSpan
    let accentTone: AccentTone

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: self.verticalSpacing) {
                self.header
                self.stats
                self.activity
                self.errorOrLimit
                self.heatmap
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(alignment: .leading) {
                if self.isHighlighted {
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                        .fill(MenuHighlightStyle.selectionBackground(true))
                        .padding(.vertical, 2)
                }
            }
            .foregroundStyle(MenuHighlightStyle.primary(self.isHighlighted))
            if self.showsSeparator {
                Rectangle()
                    .fill(Color(nsColor: .separatorColor))
                    .frame(height: 1)
                    .padding(.leading, 12)
            }
        }
    }

    @ViewBuilder
    private var header: some View {
        HStack(alignment: .top, spacing: 8) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text(self.repo.title)
                        .font(.headline)
                        .lineLimit(1)
                    if self.isPinned {
                        Image(systemName: "pin.fill")
                            .font(.caption2)
                            .foregroundStyle(MenuHighlightStyle.secondary(self.isHighlighted))
                    }
                }
                if let release = repo.latestRelease {
                    Text("Latest • \(release) • \(self.repo.latestReleaseDate ?? "")")
                        .font(.caption2)
                        .foregroundStyle(MenuHighlightStyle.secondary(self.isHighlighted))
                }
            }
            Spacer(minLength: 0)
            if self.showsSubmenuIndicator {
                Image(systemName: "chevron.right")
                    .font(.caption2.weight(.semibold))
                    .foregroundStyle(MenuHighlightStyle.secondary(self.isHighlighted))
            }
        }
    }

    @ViewBuilder
    private var stats: some View {
        HStack(spacing: 10) {
            MenuCIBadge(status: self.repo.ciStatus, runCount: self.repo.ciRunCount, isHighlighted: self.isHighlighted)
            MenuStatBadge(label: "Issues", value: self.repo.issues, isHighlighted: self.isHighlighted)
            MenuStatBadge(label: "PRs", value: self.repo.pulls, isHighlighted: self.isHighlighted)
            if let visitors = repo.trafficVisitors {
                MenuStatBadge(label: "Visitors", value: visitors, isHighlighted: self.isHighlighted)
            }
            if let cloners = repo.trafficCloners {
                MenuStatBadge(label: "Cloners", value: cloners, isHighlighted: self.isHighlighted)
            }
        }
    }

    @ViewBuilder
    private var activity: some View {
        if let activity = repo.activityLine {
            Label(activity, systemImage: "text.bubble")
                .font(.caption)
                .foregroundStyle(MenuHighlightStyle.secondary(self.isHighlighted))
                .lineLimit(2)
        }
    }

    @ViewBuilder
    private var errorOrLimit: some View {
        if let error = repo.error {
            HStack(spacing: 6) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundStyle(.yellow)
                Text(error)
                    .font(.caption)
                    .lineLimit(2)
            }
        } else if let limit = repo.rateLimitedUntil {
            HStack(spacing: 6) {
                Image(systemName: "clock")
                    .foregroundStyle(.yellow)
                Text("Rate limited until \(RelativeFormatter.string(from: limit, relativeTo: Date()))")
                    .font(.caption)
            }
        }
    }

    @ViewBuilder
    private var heatmap: some View {
        if self.showHeatmap, !self.repo.heatmap.isEmpty {
            let filtered = HeatmapFilter.filter(self.repo.heatmap, span: self.heatmapSpan)
            HeatmapView(cells: filtered, accentTone: self.accentTone)
        }
    }

    private var verticalSpacing: CGFloat { 6 }
}

struct MenuStatBadge: View {
    let label: String
    let value: Int
    let isHighlighted: Bool

    var body: some View {
        Text("\(self.label) \(self.value)")
            .font(.caption2)
            .foregroundStyle(MenuHighlightStyle.secondary(self.isHighlighted))
    }
}

struct MenuCIBadge: View {
    let status: CIStatus
    let runCount: Int?
    let isHighlighted: Bool

    var body: some View {
        HStack(spacing: 6) {
            Circle()
                .fill(self.color)
                .frame(width: 6, height: 6)
            Text("CI")
                .font(.caption2)
            if let runCount {
                Text("\(runCount)")
                    .font(.caption2).bold()
            }
        }
        .foregroundStyle(self.isHighlighted ? MenuHighlightStyle.primary(true) : self.color)
    }

    private var color: Color {
        switch self.status {
        case .passing: .green
        case .failing: .red
        case .pending: .yellow
        case .unknown: .gray
        }
    }
}

struct MenuLoggedOutView: View {
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.badge.exclam")
                .font(.system(size: 28, weight: .semibold))
                .foregroundStyle(.secondary)
            Text("Sign in to see your repositories")
                .font(.headline)
            Text("Connect your GitHub account to load pins and activity.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 140)
    }
}

struct MenuEmptyStateView: View {
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "tray.fill")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(.secondary)
            Text("No repositories yet")
                .font(.headline)
            Text("Pin a repository to see activity here.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 120)
    }
}

struct RateLimitBanner: View {
    let reset: Date

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "clock.fill")
                .foregroundStyle(.white)
            Text("Rate limit resets \(RelativeFormatter.string(from: self.reset, relativeTo: Date()))")
                .lineLimit(2)
                .foregroundStyle(.white)
            Spacer()
        }
        .font(.caption)
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(Color.orange.opacity(0.9))
        .clipShape(Capsule(style: .continuous))
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Rate limit reset: \(RelativeFormatter.string(from: self.reset, relativeTo: Date()))")
    }
}

struct ErrorBanner: View {
    let message: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(.white)
            Text(self.message)
                .lineLimit(2)
                .foregroundStyle(.white)
            Spacer()
        }
        .font(.caption)
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(Color.red.opacity(0.85))
        .clipShape(Capsule(style: .continuous))
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Error: \(self.message)")
    }
}

enum MenuHighlightStyle {
    static func primary(_ highlighted: Bool) -> Color {
        highlighted ? Color(nsColor: .selectedMenuItemTextColor) : .primary
    }

    static func secondary(_ highlighted: Bool) -> Color {
        highlighted ? Color(nsColor: .selectedMenuItemTextColor).opacity(0.85) : .secondary
    }

    static func selectionBackground(_ highlighted: Bool) -> Color {
        highlighted ? Color(nsColor: .selectedContentBackgroundColor) : .clear
    }

}
