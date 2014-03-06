namespace * example

struct Message {
  1:  i64 id,
  2:  string text
}

service ExampleService {
  Message hello(1: Message m)
}