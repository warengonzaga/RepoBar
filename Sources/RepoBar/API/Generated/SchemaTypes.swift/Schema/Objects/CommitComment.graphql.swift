// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// Represents a comment on a given Commit.
  static let CommitComment = ApolloAPI.Object(
    typename: "CommitComment",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.Comment.self,
      RepoBarGraphQL.Interfaces.Deletable.self,
      RepoBarGraphQL.Interfaces.Minimizable.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.Reactable.self,
      RepoBarGraphQL.Interfaces.RepositoryNode.self,
      RepoBarGraphQL.Interfaces.Updatable.self,
      RepoBarGraphQL.Interfaces.UpdatableComment.self
    ],
    keyFields: nil
  )
}