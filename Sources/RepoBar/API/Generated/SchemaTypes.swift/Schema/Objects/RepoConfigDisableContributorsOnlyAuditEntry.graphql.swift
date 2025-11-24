// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// Audit log entry for a repo.config.disable_contributors_only event.
  static let RepoConfigDisableContributorsOnlyAuditEntry = ApolloAPI.Object(
    typename: "RepoConfigDisableContributorsOnlyAuditEntry",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.AuditEntry.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.OrganizationAuditEntryData.self,
      RepoBarGraphQL.Interfaces.RepositoryAuditEntryData.self
    ],
    keyFields: nil
  )
}