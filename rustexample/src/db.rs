use dbinterface::*;

pub struct Database {
    emit: DatabaseEmitter,
    path: String,
    db: Option<rocksdb::DB>,
}

impl DatabaseTrait for Database {
    fn new(emit: DatabaseEmitter) -> Database {
        Database {
            emit: emit,
            path: String::new(),
            db: None,
        }
    }
    fn emit(&mut self) -> &mut DatabaseEmitter {
        &mut self.emit
    }

    fn add_value(&mut self, key: String, value: String) {
        match &self.db {
            Some(db) => db.put(key, value).unwrap(),
            None => (),
        } 
    }

    fn get_value(&self, key: String) -> String {
        if let Some(db) = &self.db {
            match db.get(key) {
                Ok(Some(value)) => format!("retrieved value {}", String::from_utf8(value).unwrap()),
                Ok(None) => format!("value not found"),
                Err(e) => format!("operational problem encountered: {}", e),
            }
        } else {
            format!("No database open")
        }
    }


    fn path(&self) -> &str {
        &self.path.as_str()
    }

    fn set_path(&mut self, path: String) {
        self.path = path;
        self.db = rocksdb::DB::open_default(&self.path).ok();
        // self.message = value;
        self.emit.path_changed();
    }
}

