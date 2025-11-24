// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// A user is an individual's account on GitHub that owns repositories and can make new content.
  static let User = ApolloAPI.Object(
    typename: "User",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.Actor.self,
      RepoBarGraphQL.Interfaces.Agentic.self,
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.PackageOwner.self,
      RepoBarGraphQL.Interfaces.ProfileOwner.self,
      RepoBarGraphQL.Interfaces.ProjectOwner.self,
      RepoBarGraphQL.Interfaces.ProjectV2Owner.self,
      RepoBarGraphQL.Interfaces.ProjectV2Recent.self,
      RepoBarGraphQL.Interfaces.RepositoryDiscussionAuthor.self,
      RepoBarGraphQL.Interfaces.RepositoryDiscussionCommentAuthor.self,
      RepoBarGraphQL.Interfaces.RepositoryOwner.self,
      RepoBarGraphQL.Interfaces.Sponsorable.self,
      RepoBarGraphQL.Interfaces.UniformResourceLocatable.self
    ],
    keyFields: nil
  )
}