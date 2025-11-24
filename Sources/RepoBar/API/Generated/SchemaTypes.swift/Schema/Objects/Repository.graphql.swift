// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension RepoBarGraphQL.Objects {
  /// A repository contains the content for a project.
  static let Repository = ApolloAPI.Object(
    typename: "Repository",
    implementedInterfaces: [
      RepoBarGraphQL.Interfaces.Node.self,
      RepoBarGraphQL.Interfaces.PackageOwner.self,
      RepoBarGraphQL.Interfaces.ProjectOwner.self,
      RepoBarGraphQL.Interfaces.ProjectV2Recent.self,
      RepoBarGraphQL.Interfaces.RepositoryInfo.self,
      RepoBarGraphQL.Interfaces.Starrable.self,
      RepoBarGraphQL.Interfaces.Subscribable.self,
      RepoBarGraphQL.Interfaces.UniformResourceLocatable.self
    ],
    keyFields: nil
  )
}