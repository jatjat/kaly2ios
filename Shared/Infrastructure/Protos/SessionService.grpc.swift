//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: Shared/Infrastructure/Protos/SessionService.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Usage: instantiate `Ca_Joelathiessen_Kaly2_Proto_SessionServiceClient`, then call methods of this protocol to make API calls.
internal protocol Ca_Joelathiessen_Kaly2_Proto_SessionServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Ca_Joelathiessen_Kaly2_Proto_SessionServiceClientInterceptorFactoryProtocol? { get }

  func subscribeNew(
    _ request: Ca_Joelathiessen_Kaly2_Proto_SubscribeNewRequest,
    callOptions: CallOptions?,
    handler: @escaping (Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse) -> Void
  ) -> ServerStreamingCall<Ca_Joelathiessen_Kaly2_Proto_SubscribeNewRequest, Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>

  func subscribeExisting(
    _ request: Ca_Joelathiessen_Kaly2_Proto_SubscribeExistingRequest,
    callOptions: CallOptions?,
    handler: @escaping (Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse) -> Void
  ) -> ServerStreamingCall<Ca_Joelathiessen_Kaly2_Proto_SubscribeExistingRequest, Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>

  func getPastIterations(
    _ request: Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsRequest, Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsResponse>

  func modifySlamSettings(
    _ request: Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsRequest, Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsResponse>

  func modifySessionSettings(
    _ request: Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsRequest, Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsResponse>
}

extension Ca_Joelathiessen_Kaly2_Proto_SessionServiceClientProtocol {
  internal var serviceName: String {
    return "ca.joelathiessen.kaly2.proto.SessionService"
  }

  /// Server streaming call to SubscribeNew
  ///
  /// - Parameters:
  ///   - request: Request to send to SubscribeNew.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  internal func subscribeNew(
    _ request: Ca_Joelathiessen_Kaly2_Proto_SubscribeNewRequest,
    callOptions: CallOptions? = nil,
    handler: @escaping (Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse) -> Void
  ) -> ServerStreamingCall<Ca_Joelathiessen_Kaly2_Proto_SubscribeNewRequest, Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse> {
    return self.makeServerStreamingCall(
      path: "/ca.joelathiessen.kaly2.proto.SessionService/SubscribeNew",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubscribeNewInterceptors() ?? [],
      handler: handler
    )
  }

  /// Server streaming call to SubscribeExisting
  ///
  /// - Parameters:
  ///   - request: Request to send to SubscribeExisting.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  internal func subscribeExisting(
    _ request: Ca_Joelathiessen_Kaly2_Proto_SubscribeExistingRequest,
    callOptions: CallOptions? = nil,
    handler: @escaping (Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse) -> Void
  ) -> ServerStreamingCall<Ca_Joelathiessen_Kaly2_Proto_SubscribeExistingRequest, Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse> {
    return self.makeServerStreamingCall(
      path: "/ca.joelathiessen.kaly2.proto.SessionService/SubscribeExisting",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubscribeExistingInterceptors() ?? [],
      handler: handler
    )
  }

  /// Unary call to GetPastIterations
  ///
  /// - Parameters:
  ///   - request: Request to send to GetPastIterations.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func getPastIterations(
    _ request: Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsRequest, Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsResponse> {
    return self.makeUnaryCall(
      path: "/ca.joelathiessen.kaly2.proto.SessionService/GetPastIterations",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetPastIterationsInterceptors() ?? []
    )
  }

  /// Unary call to ModifySlamSettings
  ///
  /// - Parameters:
  ///   - request: Request to send to ModifySlamSettings.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func modifySlamSettings(
    _ request: Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsRequest, Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsResponse> {
    return self.makeUnaryCall(
      path: "/ca.joelathiessen.kaly2.proto.SessionService/ModifySlamSettings",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeModifySlamSettingsInterceptors() ?? []
    )
  }

  /// Unary call to ModifySessionSettings
  ///
  /// - Parameters:
  ///   - request: Request to send to ModifySessionSettings.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func modifySessionSettings(
    _ request: Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsRequest, Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsResponse> {
    return self.makeUnaryCall(
      path: "/ca.joelathiessen.kaly2.proto.SessionService/ModifySessionSettings",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeModifySessionSettingsInterceptors() ?? []
    )
  }
}

internal protocol Ca_Joelathiessen_Kaly2_Proto_SessionServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'subscribeNew'.
  func makeSubscribeNewInterceptors() -> [ClientInterceptor<Ca_Joelathiessen_Kaly2_Proto_SubscribeNewRequest, Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>]

  /// - Returns: Interceptors to use when invoking 'subscribeExisting'.
  func makeSubscribeExistingInterceptors() -> [ClientInterceptor<Ca_Joelathiessen_Kaly2_Proto_SubscribeExistingRequest, Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>]

  /// - Returns: Interceptors to use when invoking 'getPastIterations'.
  func makeGetPastIterationsInterceptors() -> [ClientInterceptor<Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsRequest, Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsResponse>]

  /// - Returns: Interceptors to use when invoking 'modifySlamSettings'.
  func makeModifySlamSettingsInterceptors() -> [ClientInterceptor<Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsRequest, Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsResponse>]

  /// - Returns: Interceptors to use when invoking 'modifySessionSettings'.
  func makeModifySessionSettingsInterceptors() -> [ClientInterceptor<Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsRequest, Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsResponse>]
}

internal final class Ca_Joelathiessen_Kaly2_Proto_SessionServiceClient: Ca_Joelathiessen_Kaly2_Proto_SessionServiceClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Ca_Joelathiessen_Kaly2_Proto_SessionServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the ca.joelathiessen.kaly2.proto.SessionService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Ca_Joelathiessen_Kaly2_Proto_SessionServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Ca_Joelathiessen_Kaly2_Proto_SessionServiceProvider: CallHandlerProvider {
  var interceptors: Ca_Joelathiessen_Kaly2_Proto_SessionServiceServerInterceptorFactoryProtocol? { get }

  func subscribeNew(request: Ca_Joelathiessen_Kaly2_Proto_SubscribeNewRequest, context: StreamingResponseCallContext<Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>) -> EventLoopFuture<GRPCStatus>

  func subscribeExisting(request: Ca_Joelathiessen_Kaly2_Proto_SubscribeExistingRequest, context: StreamingResponseCallContext<Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>) -> EventLoopFuture<GRPCStatus>

  func getPastIterations(request: Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsResponse>

  func modifySlamSettings(request: Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsResponse>

  func modifySessionSettings(request: Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsResponse>
}

extension Ca_Joelathiessen_Kaly2_Proto_SessionServiceProvider {
  internal var serviceName: Substring { return "ca.joelathiessen.kaly2.proto.SessionService" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "SubscribeNew":
      return ServerStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ca_Joelathiessen_Kaly2_Proto_SubscribeNewRequest>(),
        responseSerializer: ProtobufSerializer<Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>(),
        interceptors: self.interceptors?.makeSubscribeNewInterceptors() ?? [],
        userFunction: self.subscribeNew(request:context:)
      )

    case "SubscribeExisting":
      return ServerStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ca_Joelathiessen_Kaly2_Proto_SubscribeExistingRequest>(),
        responseSerializer: ProtobufSerializer<Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>(),
        interceptors: self.interceptors?.makeSubscribeExistingInterceptors() ?? [],
        userFunction: self.subscribeExisting(request:context:)
      )

    case "GetPastIterations":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsRequest>(),
        responseSerializer: ProtobufSerializer<Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsResponse>(),
        interceptors: self.interceptors?.makeGetPastIterationsInterceptors() ?? [],
        userFunction: self.getPastIterations(request:context:)
      )

    case "ModifySlamSettings":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsRequest>(),
        responseSerializer: ProtobufSerializer<Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsResponse>(),
        interceptors: self.interceptors?.makeModifySlamSettingsInterceptors() ?? [],
        userFunction: self.modifySlamSettings(request:context:)
      )

    case "ModifySessionSettings":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsRequest>(),
        responseSerializer: ProtobufSerializer<Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsResponse>(),
        interceptors: self.interceptors?.makeModifySessionSettingsInterceptors() ?? [],
        userFunction: self.modifySessionSettings(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Ca_Joelathiessen_Kaly2_Proto_SessionServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'subscribeNew'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSubscribeNewInterceptors() -> [ServerInterceptor<Ca_Joelathiessen_Kaly2_Proto_SubscribeNewRequest, Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>]

  /// - Returns: Interceptors to use when handling 'subscribeExisting'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSubscribeExistingInterceptors() -> [ServerInterceptor<Ca_Joelathiessen_Kaly2_Proto_SubscribeExistingRequest, Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>]

  /// - Returns: Interceptors to use when handling 'getPastIterations'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGetPastIterationsInterceptors() -> [ServerInterceptor<Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsRequest, Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsResponse>]

  /// - Returns: Interceptors to use when handling 'modifySlamSettings'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeModifySlamSettingsInterceptors() -> [ServerInterceptor<Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsRequest, Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsResponse>]

  /// - Returns: Interceptors to use when handling 'modifySessionSettings'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeModifySessionSettingsInterceptors() -> [ServerInterceptor<Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsRequest, Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsResponse>]
}