#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    CFShow(@"Hello, World!");
    // NSLog(@"Hello, World!");
    [pool drain];
    return 0;
}
