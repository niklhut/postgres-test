import Vapor

extension Environment {
    
    // MARK: - Database
    
    /// The database host.
    static let dbHost = Self.get("DATABASE_HOST")!
    /// The database port.
    static let dbPort = Self.get("DATABASE_PORT")
    /// The postgres username.
    static let pgUser = Self.get("POSTGRES_USER")!
    /// The postgres password.
    ///
    /// If no postgres password is set in the environment no password is returned.
    static let pgPassword = Self.get("POSTGRES_PASSWORD") ?? ""
    /// The postgres database name.
    static let pgDbName = Self.get("POSTGRES_DB")!
    
}
