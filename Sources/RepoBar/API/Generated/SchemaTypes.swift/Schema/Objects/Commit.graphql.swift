// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// Represents a Git commit.
  static let Commit = ApolloAPI.Object(
    typename: "Commit",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.GitObject.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.Subscribable.self,
      RepoBarGraphQL.Interfaces.UniformResourceLocatable.self
    ],
    keyFields: nil
  )
}