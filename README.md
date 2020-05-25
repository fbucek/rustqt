# RustQt examaple

Example how to use Rust library in Qt application.

It uses `RocksDB` crate to store and read values.

Using [rust-qt-binding-generator](https://github.com/KDE/rust-qt-binding-generator)

## How to run

### Requirements 

`cargo install rust_qt_binding_generator` 
`cargo install cargo-make`


`cargo make`

## How does it work

`rust_qt_binding_generator` creates `.rs`, `.cpp` and `.h` files based on `bindings.json`.

### User modified files

`bindings.json` -> Binding definition
`db.rs` -> Rust implementation

### Generator files

e.g.: `rocksdb.cpp` `rocksdb.h` with `dbinterface.rs`

### Usage

```c++
#include <rocksdb.h>

Database database;
database.setPath("rocksdb");
database.addValue("version", "0.15");
```
