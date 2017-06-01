//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Line {

    public enum LineRoute {

      public static let service = APIService<Response>(id: "Line_Route", tag: "Line", method: "GET", path: "/Line/Route", hasBody: false)

      /** A comma seperated list of service types to filter on. Supported values: Regular, Night. Defaulted to 'Regular' if not specified */
      public enum ServiceTypes: String {
          case regular = "Regular"
          case night = "Night"

          public static let cases: [ServiceTypes] = [
            .regular,
            .night,
          ]
      }

      public class Request: APIRequest<Response> {

          public struct Options {

              /** A comma seperated list of service types to filter on. Supported values: Regular, Night. Defaulted to 'Regular' if not specified */
              public var serviceTypes: [ServiceTypes]?

              public init(serviceTypes: [ServiceTypes]? = nil) {
                  self.serviceTypes = serviceTypes
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: LineRoute.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(serviceTypes: [ServiceTypes]? = nil) {
              let options = Options(serviceTypes: serviceTypes)
              self.init(options: options)
          }

          public override var parameters: [String: Any] {
              var params: JSONDictionary = [:]
              if let serviceTypes = options.serviceTypes?.encode() {
                params["serviceTypes"] = serviceTypes
              }
              return params
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [Line]

            /** OK */
            case success200([Line])

            public var success: [Line]? {
                switch self {
                case .success200(let response): return response
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                case .success200(let response): return response
                }
            }

            public var statusCode: Int {
              switch self {
              case .success200: return 200
              }
            }

            public var successful: Bool {
              switch self {
              case .success200: return true
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .success200(JSONDecoder.decode(data: data))
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