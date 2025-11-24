// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// Audit log entry for a oauth_application.create event.
  static let OauthApplicationCreateAuditEntry = ApolloAPI.Object(
    typename: "OauthApplicationCreateAuditEntry",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.AuditEntry.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.OauthApplicationAuditEntryData.self,
      RepoBarGraphQL.Interfaces.OrganizationAuditEntryData.self
    ],
    keyFields: nil
  )
}