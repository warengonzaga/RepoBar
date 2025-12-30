import Foundation
import Security

public struct GitExecutableInfo: Equatable, Sendable {
    public let path: String
    public let version: String?

    public init(path: String, version: String?) {
        self.path = path
        self.version = version
    }
}

struct GitExecutableLocator: Sendable {
    static let shared = GitExecutableLocator()
    let url: URL

    init() {
        let fileManager = FileManager.default
        let envPath = ProcessInfo.processInfo.environment["PATH"] ?? ""
        let pathCandidates = envPath
            .split(separator: ":")
            .map { "\($0)/git" }

        let preferred: [String] = if Self.isSandboxed {
            ["/usr/bin/git"]
        } else {
            [
                "/opt/homebrew/bin/git",
                "/usr/local/bin/git"
            ]
        }

        let candidates = preferred + pathCandidates + ["/usr/bin/git"]
        let resolved = candidates.first { fileManager.isExecutableFile(atPath: $0) } ?? "/usr/bin/git"
        self.url = URL(fileURLWithPath: resolved)
    }

    private static var isSandboxed: Bool {
        guard let task = SecTaskCreateFromSelf(nil) else { return false }
        let entitlement = SecTaskCopyValueForEntitlement(task, "com.apple.security.app-sandbox" as CFString, nil)
        return (entitlement as? Bool) == true
    }

    static func version(at url: URL) -> String? {
        let process = Process()
        process.executableURL = url
        process.arguments = ["--version"]
        let out = Pipe()
        let err = Pipe()
        process.standardOutput = out
        process.standardError = err
        do {
            try process.run()
        } catch {
            return nil
        }
        process.waitUntilExit()
        if process.terminationStatus != 0 { return nil }
        let data = out.fileHandleForReading.readDataToEndOfFile()
        let raw = String(data: data, encoding: .utf8) ?? ""
        let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? nil : trimmed
    }
}
