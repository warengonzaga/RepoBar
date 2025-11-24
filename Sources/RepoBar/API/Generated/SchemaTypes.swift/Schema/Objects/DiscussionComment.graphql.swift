// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// A comment on a discussion.
  static let DiscussionComment = ApolloAPI.Object(
    typename: "DiscussionComment",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.Comment.self,
      RepoBarGraphQL.Interfaces.Deletable.self,
      RepoBarGraphQL.Interfaces.Minimizable.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.Reactable.self,
      RepoBarGraphQL.Interfaces.Updatable.self,
      RepoBarGraphQL.Interfaces.UpdatableComment.self,
      RepoBarGraphQL.Interfaces.Votable.self
    ],
    keyFields: nil
  )
}