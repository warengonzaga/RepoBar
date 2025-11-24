// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// A review object for a given pull request.
  static let PullRequestReview = ApolloAPI.Object(
    typename: "PullRequestReview",
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