use interface::*;
use rocksdb::DB;


pub struct Database {
    emit: DatabaseEmitter,
    path: String,
    message: String,
}

impl DatabaseTrait for Database {
    fn new(emit: DatabaseEmitter) -> Database {
        Database {
            emit: emit,
            message: String::new(),
            path: String::new(),
        }
    }
    fn emit(&mut self) -> &mut DatabaseEmitter {
        &mut self.emit
    }
    fn message(&self) -> &str {
        &self.message.as_str()
    }

    fn path(&self) -> &str {
        &self.path.as_str()
    }

    fn set_path(&mut self, value: String) {
        self.path = value;
        let db = DB::open_default(&self.path).unwrap();
        db.put(b"my key", b"my value").unwrap();
        self.message = match db.get(b"my key") {
            Ok(Some(value)) => format!("retrieved value {}", String::from_utf8(value).unwrap()),
            Ok(None) => format!("value not found"),
            Err(e) => format!("operational problem encountered: {}", e),
        };
        db.delete(b"my key").unwrap();

        // self.message = value;
        self.emit.path_changed();
    }
}

