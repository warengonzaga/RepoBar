// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// Represents a comment on an Gist.
  static let GistComment = ApolloAPI.Object(
    typename: "GistComment",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.Comment.self,
      RepoBarGraphQL.Interfaces.Deletable.self,
      RepoBarGraphQL.Interfaces.Minimizable.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.Updatable.self,
      RepoBarGraphQL.Interfaces.UpdatableComment.self
    ],
    keyFields: nil
  )
}