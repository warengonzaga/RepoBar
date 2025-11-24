// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// Audit log entry for a repo.create event.
  static let RepoCreateAuditEntry = ApolloAPI.Object(
    typename: "RepoCreateAuditEntry",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.AuditEntry.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.OrganizationAuditEntryData.self,
      RepoBarGraphQL.Interfaces.RepositoryAuditEntryData.self
    ],
    keyFields: nil
  )
}