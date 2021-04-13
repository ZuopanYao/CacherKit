//
//  TestOC.h
//  Example
//
//  Created by Harvey on 2021/4/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjectCoding : NSObject<NSCoding>

@property (strong) NSString* name;
@property (assign) NSInteger age;

@end


@interface TestOC : NSObject

@end

NS_ASSUME_NONNULL_END
