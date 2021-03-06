//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension PetstoreTest.Pet {

    public enum UpdatePet {

      public static let service = APIService<Response>(id: "updatePet", tag: "pet", method: "PUT", path: "/pet", hasBody: true, authorization: Authorization(type: "petstore_auth", scope: "write:pets"))

      public class Request: APIRequest<Response> {

          public var body: Pet

          public init(body: Pet) {
              self.body = body
              super.init(service: UpdatePet.service)
          }

          public override var jsonBody: Any? {
              return body.encode()
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /** Invalid ID supplied */
            case status400

            /** Pet not found */
            case status404

            /** Validation exception */
            case status405

            public var success: Void? {
                switch self {
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                default: return ()
                }
            }

            public var statusCode: Int {
              switch self {
              case .status400: return 400
              case .status404: return 404
              case .status405: return 405
              }
            }

            public var successful: Bool {
              switch self {
              case .status400: return false
              case .status404: return false
              case .status405: return false
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 400: self = .status400
                case 404: self = .status404
                case 405: self = .status405
                default: throw APIError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
