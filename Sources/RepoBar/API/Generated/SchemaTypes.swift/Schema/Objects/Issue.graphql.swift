// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// An Issue is a place to discuss ideas, enhancements, tasks, and bugs for a project.
  static let Issue = ApolloAPI.Object(
    typename: "Issue",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.Assignable.self,
      RepoBarGraphQL.Interfaces.Closable.self,
      RepoBarGraphQL.Interfaces.Comment.self,
      RepoBarGraphQL.Interfaces.Deletable.self,
      RepoBarGraphQL.Interfaces.Labelable.self,
      RepoBarGraphQL.Interfaces.Lockable.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.ProjectV2Owner.self,
      RepoBarGraphQL.Interfaces.Reactable.self,
      RepoBarGraphQL.Interfaces.RepositoryNode.self,
      RepoBarGraphQL.Interfaces.Subscribable.self,
      RepoBarGraphQL.Interfaces.SubscribableThread.self,
      RepoBarGraphQL.Interfaces.UniformResourceLocatable.self,
      RepoBarGraphQL.Interfaces.Updatable.self,
      RepoBarGraphQL.Interfaces.UpdatableComment.self
    ],
    keyFields: nil
  )
}