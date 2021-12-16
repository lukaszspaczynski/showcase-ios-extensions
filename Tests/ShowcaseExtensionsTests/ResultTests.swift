//
//  File.swift
//  
//
//  Created by Lukasz Spaczynski on 16/12/2021.
//

import Foundation
import Nimble
import XCTest
import RxSwift
import RxBlocking

@testable import ShowcaseExtensions

final class ResultTests: XCTestCase {
    
    private enum DummyError: Error {
        case dummy
    }
    
    func testValue() {
        // GIVEN
        let sut = Result<String, Error>.success("test")
        
        //THEN
        expect(sut.value).toNot(beNil())
        expect(sut.error).to(beNil())
        expect(sut.hasValue).to(beTrue())
        expect(sut.hasError).to(beFalse())
    }
    
    func testError() {
        // GIVEN
        let sut = Result<String, DummyError>.failure(.dummy)
        
        //THEN
        expect(sut.value).to(beNil())
        expect(sut.error).toNot(beNil())
        expect(sut.hasValue).to(beFalse())
        expect(sut.hasError).to(beTrue())
    }
    
    func testObservableValue() throws {
        // GIVEN
        let sut = Result<String, Error>.success("test")
        
        // WHEN
        let observable = sut.asObservable()
        let result = try observable
            .toBlocking()
            .first()
        
        // THEN
        expect(result).toNot(beNil())
        expect(result).to(equal("test"))
    }
    
    func testObservableError() {
        // GIVEN
        let sut = Result<String, DummyError>.failure(.dummy)
        
        // WHEN
        let observable = sut.asObservable()
        do {
            _ = try observable
                .toBlocking()
                .first()
        } catch {
            // THEN
            expect(error).to(beAKindOf(DummyError.self))
        }
    }
}
