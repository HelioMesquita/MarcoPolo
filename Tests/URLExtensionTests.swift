@testable import MarcoPolo
import XCTest

class URLExtensionTests: XCTestCase {
  func testPageWithoutQueryParameters() {
    let sut = URL(string: "https://www.google.com.br/search/first/page")!
    XCTAssertEqual(sut.pages(), ["search", "first", "page"])
  }

  func testPageWithQueryParameters() {
    let sut = URL(string: "https://www.google.com.br/search?q=stack+overflow&sxsrf=APwXEdeYlGMuVRpybBRopIpSYIJFxUH8tg%3A1681863109322&source=hp&ei=xTE_ZNraEaX91sQPoo2F2AE&iflsig=AOEireoAAAAAZD8_1dbQ1HdUs54DoaAeL3WWBd_NP4yM&oq=stack&gs_lcp=Cgdnd3Mtd2l6EAMYADIICAAQgAQQsQMyCAgAEIAEELEDMgcIABCKBRBDMgUIABCABDIICAAQgAQQsQMyBQgAEIAEMgcIABCKBRBDMggIABCABBCxAzIICAAQgAQQsQMyBQgAEIAEOgQIIxAnOgYIIxAnEBM6CwguEIAEELEDEIMBOgsIABCABBCxAxCDAToRCC4QgAQQsQMQgwEQxwEQ0QM6BwguEIoFEEM6DQguEIoFEMcBENEDEEM6EAguEIoFELEDEMcBENEDEEM6CAguEIAEELEDOgcIABCABBAKUABY6AZg5iBoAHAAeACAAdUBiAGLBpIBBTAuNC4xmAEAoAEB&sclient=gws-wiz")!
    XCTAssertEqual(sut.pages(), ["search"])
  }
}
