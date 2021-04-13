//
//  TestOC.m
//  Example
//
//  Created by Harvey on 2021/4/12.
//

#import "TestOC.h"
#import <CacherKit/CacherKit.h>
#import "Example-Swift.h"

@implementation ObjectCoding

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Harvey";
        self.age = 28;
    }
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeInt:self.age forKey:@"age"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.age = [coder decodeIntForKey:@"age"];
    }
    
    return self;
}

@end


@implementation TestOC

+ (void)load {
    
    ObjectCoding *obj = [[ObjectCoding alloc] init];
    CKMemory *manager = CKMemory.shared;
    [manager set:@"testkdfkdk" key:CKKey.mykey2];
    [manager set:obj key:CKKey.mykey3];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"%@", [manager value:CKKey.mykey2].string);
        NSLog(@"%@", ((ObjectCoding *)[manager value:CKKey.mykey3].any).name);
        NSLog(@"%d", ((ObjectCoding *)[manager value:CKKey.mykey3].any).age);
    });
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}
@end
