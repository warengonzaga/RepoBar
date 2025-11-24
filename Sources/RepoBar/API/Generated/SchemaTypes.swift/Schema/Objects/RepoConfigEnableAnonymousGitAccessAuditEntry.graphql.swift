// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// Audit log entry for a repo.config.enable_anonymous_git_access event.
  static let RepoConfigEnableAnonymousGitAccessAuditEntry = ApolloAPI.Object(
    typename: "RepoConfigEnableAnonymousGitAccessAuditEntry",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.AuditEntry.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.OrganizationAuditEntryData.self,
      RepoBarGraphQL.Interfaces.RepositoryAuditEntryData.self
    ],
    keyFields: nil
  )
}