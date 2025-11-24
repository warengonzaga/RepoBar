// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// Audit log entry for a team.remove_repository event.
  static let TeamRemoveRepositoryAuditEntry = ApolloAPI.Object(
    typename: "TeamRemoveRepositoryAuditEntry",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.AuditEntry.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.OrganizationAuditEntryData.self,
      RepoBarGraphQL.Interfaces.RepositoryAuditEntryData.self,
      RepoBarGraphQL.Interfaces.TeamAuditEntryData.self
    ],
    keyFields: nil
  )
}