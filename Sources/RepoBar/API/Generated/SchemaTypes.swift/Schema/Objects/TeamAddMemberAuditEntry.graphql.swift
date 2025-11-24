// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// Audit log entry for a team.add_member event.
  static let TeamAddMemberAuditEntry = ApolloAPI.Object(
    typename: "TeamAddMemberAuditEntry",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.AuditEntry.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.OrganizationAuditEntryData.self,
      RepoBarGraphQL.Interfaces.TeamAuditEntryData.self
    ],
    keyFields: nil
  )
}