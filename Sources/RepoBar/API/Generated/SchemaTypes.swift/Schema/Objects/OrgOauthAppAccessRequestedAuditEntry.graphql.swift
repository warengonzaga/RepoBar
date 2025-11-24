// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// Audit log entry for a org.oauth_app_access_requested event.
  static let OrgOauthAppAccessRequestedAuditEntry = ApolloAPI.Object(
    typename: "OrgOauthAppAccessRequestedAuditEntry",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.AuditEntry.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.OauthApplicationAuditEntryData.self,
      RepoBarGraphQL.Interfaces.OrganizationAuditEntryData.self
    ],
    keyFields: nil
  )
}