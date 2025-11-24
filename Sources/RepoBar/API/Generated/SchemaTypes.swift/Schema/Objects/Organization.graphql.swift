// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// An account on GitHub, with one or more owners, that has repositories, members and teams.
  static let Organization = ApolloAPI.Object(
    typename: "Organization",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.Actor.self,
      RepoBarGraphQL.Interfaces.MemberStatusable.self,
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