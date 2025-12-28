import Foundation

public extension ActivityEvent {
    var line: String { "\(self.actor): \(self.title)" }
}

public extension Repository {
    var activityLine: String? { (self.latestActivity ?? self.activityEvents.first)?.line }
    var activityURL: URL? { (self.latestActivity ?? self.activityEvents.first)?.url }

    /// Returns the most recent activity date between latest activity and last push.
    var activityDate: Date? {
        let activityDate = (self.latestActivity ?? self.activityEvents.first)?.date
        switch (activityDate, self.pushedAt) {
        case let (left?, right?):
            max(left, right)
        case let (left?, nil):
            left
        case let (nil, right?):
            right
        default:
            nil
        }
    }

    func activityLine(fallbackToPush: Bool) -> String? {
        if let line = self.activityLine { return line }
        if fallbackToPush, self.pushedAt != nil { return "push" }
        return nil
    }
}
