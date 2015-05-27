//
//  SpaceSoundsModelTests.m
//  Blackswan
//
//  Created by Tomas McGuinness on 27/05/2015.
//  Copyright (c) 2015 Cold Bear Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SpaceSoundsModel.h"

@interface SpaceSoundsModelTests : XCTestCase


@end

@implementation SpaceSoundsModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNumberOfSounds{
    
    NSString *filePath = [[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingPathComponent:@"sample_response.json"];

    NSData *json = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error;
    
    SpaceSoundsModel *model = [SpaceSoundsModel new];
    [model loadData:json withError:&error];
    
    if(error)
    {
        XCTFail(@"No error should have been returned");
    }
    
    XCTAssert(10 == [model.numberOfSounds intValue], "Unexpected number of sounds");
}

- (void)testSoundArray {
    
    NSString *filePath = [[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingPathComponent:@"sample_response.json"];
    
    NSData *json = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error;
    
    SpaceSoundsModel *model = [SpaceSoundsModel new];
    [model loadData:json withError:&error];
    
    if(error)
    {
        XCTFail(@"No error should have been returned");
    }
    
    NSInteger arrayLength = [model.sounds count];
    
    XCTAssert(10 == arrayLength, "Unexpected number of sounds");
}

- (void)testFirstSound{
    
    NSString *filePath = [[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingPathComponent:@"sample_response.json"];
    
    NSData *json = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error;
    
    SpaceSoundsModel *model = [SpaceSoundsModel new];
    [model loadData:json withError:&error];
    
    if(error)
    {
        XCTFail(@"No error should have been returned");
    }
    
    SpaceSound *sound = [model.sounds firstObject];
    
    XCTAssertNotNil(sound.title);
    XCTAssert([sound.title isEqualToString:@"Voyager 1: Three \"Tsunami Waves\" in Interstellar Space"]);
    XCTAssertNotNil(sound.desc);
    XCTAssert([sound.desc isEqualToString:@"The Voyager 1 spacecraft has experienced three \"tsunami waves\" in interstellar space. Listen to how these waves cause surrounding ionized matter to ring. More details on this sound can be found here: http://www.nasa.gov/jpl/nasa-voyager-tsunami-wave-still-flies-through-interstellar-space/"]);
    XCTAssertNotNil(sound.streamUrl);
    XCTAssert([sound.streamUrl isEqualToString:@"https://api.soundcloud.com/tracks/181835738/stream"]);
    XCTAssertNotNil(sound.duration);
    XCTAssert([sound.duration intValue] == 18365);

}

- (void)testLastSound{
    
    NSString *filePath = [[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingPathComponent:@"sample_response.json"];
    
    NSData *json = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error;
    
    SpaceSoundsModel *model = [SpaceSoundsModel new];
    [model loadData:json withError:&error];
    
    if(error)
    {
        XCTFail(@"No error should have been returned");
    }
    
    SpaceSound *sound = [model.sounds lastObject];
    
    XCTAssertNotNil(sound.title);
    XCTAssert([sound.title isEqualToString:@"Lookin At It"]);
    XCTAssertNil(sound.desc);
    XCTAssertNotNil(sound.streamUrl);
    XCTAssert([sound.streamUrl isEqualToString:@"https://api.soundcloud.com/tracks/172463116/stream"]);
    XCTAssertNotNil(sound.duration);
    XCTAssert([sound.duration intValue] == 2429);
}

- (void)testInvalidData{
    
    NSData *json = [@"NOT A JSON STRING" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    
    SpaceSoundsModel *model = [SpaceSoundsModel new];
    [model loadData:json withError:&error];
    
    if(!error)
    {
        XCTFail(@"An error should have been returned");
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
