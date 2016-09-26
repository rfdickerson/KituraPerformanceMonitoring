# Kitura Performance Monitoring and Instrumentation

Example of using Aphid for Performance Monitoring

```swift
func handleGet(request: RouterRequest,
                   response: RouterResponse,
                   next: @escaping() -> Void) throws
{
        measureBlock {
            // Do lots of work here and send measurements to the broker.
        }
        
        response.status(.OK).send("hello")
        
        next()
}
```
