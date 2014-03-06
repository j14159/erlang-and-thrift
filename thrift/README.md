Thrift Definitions
==================

If you run `thrift -gen erl example.thrift` in this folder, it will produce .hrl and .erl files in a folder called `gen-erl`.  Copy the .hrl files to the include folder in the project root and the .erl files into the source folder in the project root.  Thrift will use these to encode/decode the Thrift messages.

